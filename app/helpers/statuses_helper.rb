module StatusesHelper

	def generate_hl7(status)
		wp_patient = status.wound.patient
		wp_wound = status.wound
    
    run_parser(wp_patient, wp_wound, status)
	end

  private

  def run_parser(patient,wound,status)
    first_msgs = concat_arrays(build_MSH, build_PID(patient), build_PV1, build_OBX) 
    front_string = join_array_segments(first_msgs)
    #replace_ws_w_delim(front_string) << build_NTE(wound,status)
    first_msgs + build_NTE(wound,status).flatten(1)
  end

  #HELPERS#
  def join_array_segments(segments) #returns string
    segments.join("\r")
  end

  def hl7_time
    DateTime.now.strftime("%y%m%d%R").gsub(/:/,"")
  end

  def format_bday(dobtime)
  	dobtime.to_s.gsub(/\s.+$/,"").gsub(/-/,"")
  end

  def concat_arrays(*args)
    p args.inject(:+)
  end

  def replace_ws_w_delim(arrayofarrays)

  	string.gsub(/\s/, '^')
  end

  #BUILDERS#
  def build_MSH
  	["MSH|^~\&|WA|WAMS|#{hl7_time}|ORU-R01|{recv_app}|{recv_facility}|{message_control_id_here}|{processing_id}|{version_id}"]
  end

  def build_PID(patient)
    ["PID||{patient_identifier_list}|#{patient.name}|#{format_bday(patient.birthdate)}||#{patient.sex}"]
  end

  def build_PV1
    ["PV1||{patient_class}|{assigned_patient_location}|{attending_doctor}"]
  end

  def build_OBX
    #http://www.interfaceware.com/hl7-standard/hl7-segment-OBX.html
    ["OBX||{observation_identifier}|{observation_value}|{observation_result_status}|{responsible_observer}|{performing_org}"]
  end

  def build_NTE(wound,status)
    num = 1
    nte_statuses = link_NTE_statuses(wound,status)

    nte_statuses.inject(Array.new) do |memo, item|
      memo << item.map { |s| "NTE||#{num+=1}|#{s}" }
    end
  end

  def link_NTE_statuses(wound, status)
    #don't fill whitespace with ^^^'s
    [["Location: #{wound.location}"],["Stage: #{status.stage}"],["Stage Desc: #{status.stage_description}"],["Appearance: #{status.appearance}"],["#{status.stage}"],["#{status.appearance}"],
    ["Drainage: #{status.drainage}"],["Odor: #{status.odor}"],["Color: #{status.color}"],["Treatment Response: #{status.treatment_response}"],["Treatment: #{status.treatment}"],
    ["Length: #{status.length}"],["Width: #{status.width}"],["Depth: #{status.depth}"],["Tunnel: #{status.tunnel}"],["Pain: #{status.pain}"],["Note: #{status.note}"]]
    #add NTE||#{n}
  end 

end