*** Settings ***

Documentation    Global documentation
Library          SeleniumLibrary

Library		./library/getip.py

Library		 Process

Test Setup       Begin Web Test

Test Teardown    End Web Test





*** Variables ***

${BROWSER} =		chrome

${URL} =    		http://192.168.1.172:5000

${IP} = 		return_ip

${PORT} =		5000

*** Keywords ***

Begin Web Test

      Start Process  resources/start_server.sh  shell=yes

      Open Browser	${URL}  	${BROWSER}

      Maximize Browser Window



End Web Test

	Terminate Process

	Close Browser



Server Is Up

	Wait Until Page Contains Element	//*[@id="script_rotation_right"]
	Page Should Contain	Rotation

	Click Button		xpath://button[@id="script_reset_encoders"]


User Clicks Button Rotation Right

	Click Button	//*[@id="script_rotation_right"]



User Clicks Button Rotation Left

	Click Button	//*[@id="script_rotation_left"]



User Enters Value In Field

	Click Element	//*[@id="manual_rotation_buttons"]/div/input

	Input Text      //*[@id="manual_rotation_buttons"]/div/input  23

	Click Button	//*[@id="script_rotation_position"]



	User presses up value button in textfield

	Click Element	//*[@id="manual_rotation_buttons"]/div/input

	Click Button     //*[@id="manual_rotation_buttons"]/div/input  23

	Click Button	//*[@id="script_rotation_position"]



User Expects The Rotor To Rotate To The Right

	Page Should Contain	Rotation	# Placeholder for Gherkin



User Expects The Rotor To Rotate To The Left

	Page Should Contain	Rotation	# Placeholder for Gherkin



User Expects The Rotor To Move

	Page Should Contain	Rotation	# Placeholder for Gherkin







*** Test Cases ***



Roatate To The Right

	[Documentation]		Clicking the Roatate to the Right
	[Tags]			Rotation_Right
    Given Server Is Up

	When User Clicks Button Rotation Right

	Then User Expects The Rotor To Rotate To The Right



Roatate To The Left

	[Documentation]		Clicking the Roatation_Left button
	[Tags]			Roatate_Left
     	Given Server Is Up

	When User Clicks Button Rotation Left

	Then User Expects The Rotor To Rotate To The Left



Pitch Value

	[Documentation]		Change Roatation value then press GO!
	[Tags]			Roatateion_value
     	Given Server Is Up

	When User Enters Value In Field

	Then User Expects The Rotor To Move
