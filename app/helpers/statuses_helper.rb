module StatusesHelper

  def generate_hl7(status)
    wp_patient = status.wound.patient
    wp_wound = status.wound
    run_parser(wp_patient, wp_wound, status)
  end

  private

  def run_parser(patient,wound,status)
    container = [build_MSH, build_PID(patient), build_PV1, build_OBX]
    first_msgs = container.inject(:+).map { |string| string.gsub(/\s/, '^') }
    front_string = first_msgs.join("\r")
    first_msgs + build_NTE(wound, status)
  end

  #HELPERS#
  def hl7_time
    DateTime.now.strftime("%y%m%d%R").gsub(/:/,"")
  end

  def format_bday(dobtime)
    dobtime.to_s.gsub(/\s.+$/,"").gsub(/-/,"")
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

  def build_NTE(wound, status)
    link_NTE_statuses(wound, status).map.with_index(1) do |item, index|
      "NTE||#{index}|#{item}"
    end
  end

  def link_NTE_statuses(wound, status)
    [
      "Location: #{wound.location}",
      "Stage: #{status.stage}",
      "Stage Desc: #{status.stage_description}",
      "Appearance: #{status.appearance}",
      "Drainage: #{status.drainage}",
      "Odor: #{status.odor}",
      "Color: #{status.color}",
      "Treatment Response: #{status.treatment_response}",
      "Treatment: #{status.treatment}",
      "Length: #{status.length}",
      "Width: #{status.width}",
      "Depth: #{status.depth}",
      "Tunnel: #{status.tunnel}",
      "Pain: #{status.pain}",
      "Note: #{status.note}"
    ]
  end 

end