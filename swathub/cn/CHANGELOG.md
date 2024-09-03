# CHANGELOG

v1.8.1 (2024-9-15)
---

### Features
* Add experimental system operation `GPT Command` to automate based on LLM.
* Add step option `llmOptions` to define LLM settings.

### Bug Fixes
* Fix task finished issue of controlled robots.

v1.8.0 (2023-6-31)
---

### Features
* Provide SWATHub Desktop for flow building.
* Refresh SWATHub Robot UI.
* Refactor SWATHub Engine.

v1.7.12 (2022-12-31)
---

### Features
* Add execution plan and execution report.
* Add new control operations including `Continue`, `Break`, `Return` and `Exit`.
* Add `Element Exists` operations for Web, Windows and Mobile app, and `Image Exists` operation for GUI model.
* Support new step option `stepBypass` to handle step ignore mechanism.
* Support environmental variables for task execution.
* Enhance extended attributes in web model template.
* Add input params validation for all system operations.

### Bug Fixes
* Fix output params change issue for interceptors.
* Fix mouse click issues for minimized window.
* Fix Firefox not working issue with customized profile.
* Fix sender nickname issue for `Send STMP Email` operation.
* Fix Chrome multiple sessions issue.

v1.7.11 (2022-09-30)
---

### Features
* Provide new robot application with refreshed UI design and system architecture.
* Support robot on macOS M1 platform.
* Support Appium 2.0 for mobile devices.
* Enhance execution logs in API operations.

### Bug Fixes
* Fix native app scrollIntoView unstable issue on Android.
* Fix test case synchronization issue with Excel.

v1.7.10 (2022-06-15)
---

### Features
* Add new model for Windows application.
* Enhance API operation to support form and xml data.
* Support automation of Java Swing application.
* Refine robot extension architecture.
* Support customized Edge profile.

### Bug Fixes
* Fix robot login issue if workspace not selected.
* Fix scenario package deploy issue if scenario code duplicated.
* Fix model import issue during workspace import in append mode.
* Fix excel write range issue with number in e-exponetial expression.
* Fix `keepSession` step option issue during session attach operation.

v1.7.9 (2021-12-31)
---

### Features

* Add `Parse PDF Invoice` system operation and enhance `Read PDF Text` system operation.
* Add param `Method` in system operations `Call JSON API`.
* Improve step option `browserKeepSession` and `mobileKeepSession`.
* Add `Get Workspaces` and `Get Testsets` system API.
* Enable robot identifier displayed as 2-D barcode in SWATHub Robot.
* Fetch the first case as default data for execution in SWATHub Designer.

### Bug Fixes

* Fix Let's Encrypt root certificate expired issue.
* Fix data with comma issue in `Read CSV` system operation.
* Fix element locating and focus issue in windows app automation.
* Fix scrollable element screenshot issue in a frame.

v1.7.8 (2021-11-30)
---

### Features

* Add new control operations `Switch` and `Case`.
* Add new datetime operations `Datetime Format` and `Datetime Parse`.
* Add new os operation `Send Notification`.
* Add new system parameter `${errorMessage}` to display the caught error.
* Enhance error messages for Outlook relative system operations.
* Improve the schema validation for scenario json.

### Bug Fixes

* Fix commented steps display issue in robot debug mode.
* Fix default params not working issue in `Record Screen` system operation.
* Fix `mobileScrollIntoView` not working issue in some Android apps.
* Fix upgrade icon display issue for flow with changed output arguments.

v1.7.7 (2021-10-31)
---

### Features

* Add new control operations `For Each` and `Throw`.
* Add new parameter for `Execute Batch` system operation to define if running in the background.
* Confirm Windows 11 platform compatibility for SWATHub Robot.
* Support `DEL` and `ENTER` key in the `Press Key` system operation for Android.
* Support `Windows` key in the `Send Hot Key` system operation.
* Provide JavaScript code editor in SWATHub Designer.

### Bug Fixes

* Fix `header` param not working issue in `Read JSON` system operation.

v1.7.6 (2021-9-30)
---

### Features

* Provide experimental desktop robot designer.
* Add mobile GUI commands `Find Image`, `Click Image` and `Get Image`.
* Support deleting archived scenarios.
* Display runtime value of output variables in execution result viewer.

### Bug Fixes
* Fix SWATHub API `Get Scenario` and `Get Flow`.
* Fix scenario save error caused by duplicate codes.
* Fix execution error with after interceptor.

v1.7.5 (2021-7-31)
---

### Features

* Provide experimental step recorder function at desktop scenario builder.
* Add network system operations `FTP Upload` and `FTP Download`.
* Refine operation sorting in scenario builder for GUI and Mobile models.
* Extend session idle timeout for embedded selenium server.
* Add case filter for SWATHub API - Run Workspace.
* Support locating sheet by index in Excel system operations.

### Bug Fixes
* Fix cron job exception during webdriver refreshment at robot side.
* Fix output arguments copy issue for steps with more than one argument.
* Fix internal API error for desktop scenario builder.

v1.7.4 (2021-6-15)
---

### Features

* Provide experimental scenario builder at robot side.
* Support platform session management and add system operation `Attach Browser` and `Attach App`.
* Add web system operation `Drag and Drop`.
* Add SWATHub API `Create Scenario / Flow`.
* Enhance transaction processing at SWATHub server for evidence upload.
* Enhance robot local storage and task management to improve stability.
* Upgrade internal Tomcat application server for stability.
* Enable robot evidences auto clearing for all tasks.

### Bug Fixes
* Fix robot session issue during parallel execution.
* Fix coordinate infinity issue during app model capture.
* Fix assertion issue of negative rules for multi-frame web pages.
* Fix robot initiated browser detection issue.
* Fix evidences folder not deleted issue in cleanup jobs.

v1.7.3 (2021-4-15)
---

### Features

* Provide experimental Web Inspect Tool as browser extensions.
* Add web system operations including `Click Element`, `Hover Element`, `Select Options` and `Type Text`.
* Support robot task retention mechanism for offline mode only.
* Enhance resource files such as addons and drivers update process during robot startup.
* Add step option `browserDownloadDir` to support setting default download folder at scenario level.

### Bug Fixes
* Fix input parameter with full-width dot ignored issue.
* Fix handle alert execution sequence issue.
* Fix element not found issue for button group with static select mode.

v1.7.2 (2021-2-28)
---

### Features

* Support version control mechanism for scenario and flow.
* Provide management client of Mobile Device Manager inside SWATHub Robot.
* Add `SWATHubInspect` tool to facilicate element selector generation for Windows applications.
* Add system operations `App Control` and  `Press Key` for app automation.
* Support alert handling for webview pages inside hybrid app.
* Enhance workspace export mechanism to reduce memory comsumption.
* Improve testware query algorithm for server cleanup jobs.
* Add access control for the manager role of Robot Control Center.
* Improve excel system operations `Read Range` and `Write Range` for large data.
* Decode the output text with current os charset for system operation `Execute Batch`.
* Improve the batch scenario packages generation for SWATHub API.

### Bug Fixes
* Fix app source xml not packaged issue for result diagnosis file.
* Fix element locator issue if the name contains invalid characters.
* Fix tasks find by job slow issue.
* Fix Jenkins plugin download link issue.
* Fix after interceptor not invoked in case of error issue.
* Fix frame not found error not thrown issue.
* Fix regex selector not supported for extended label policy issue.

v1.7.1 (2020-12-31)
---

### Features

* Provide alpha version of Mobile Device Manager to support multiple devices execution in parallel.
* Refactor SWATHub Enterprise subscription policy to support single deployment with both design functions and control centers.
* Add `Dataframe Join` system operation to support left outer join two dataframes.
* Add `Read Cell Formula` and `Write Cell Formula` to facilitate excel formula operations.
* Support append mode to text system operations including `Write Text` and `Write CSV`.
* Support `Set to Clipboard` system operation to copy text to system clipboard.

### Bug Fixes
* Fix element not found issue in case of frame switching error.
* Fix os or browser version issue for result export tools.

v1.7.0 (2020-11-30)
---

### Features

* Support workspace export as plain texts for the ease of Version Control System integraiton.
* Enhance SWATHub documents including user manuals and development guides.
* Refactor result viewer page on both SWATHub and robot side.
* Sort out geckodriver versions to support legacy Firefox browsers.
* Support more than 10,000 cases in one Excel file for Test Set synchronization.
* Enhance flow argument management to support sorting and searching.
* Improve result export Excel format for both SWATHub and result-export tool.
* Adjust icon display for scenario summary.
* Improve result cleanup mechanism to avoid memory overload.
* Remove job tags on web model import page.
* Support proxy settings for result-export tool.
* Add new step option `mobileScrollIntoView` to scroll element into viewport before interaction, for Native App only.

### Bug Fixes
* Fix invalid parameters naming with white spaces.
* Fix scenario package version display error on robot side.
* Fix system operation output arguments error on v1.6.2 robot.
* Fix SWATHub access control for scenario package download.

v1.6.8 (2020-10-30)
---

### Features
* Improve scenario builder to support keyboard shortcuts, add menu links and category names.
* Support saving extra evidences for Execute Plugin system operation.
* Add internal variable `${os}` and `${browser}` in runtime execution.

### Bug Fixes
* Fix nested flow return issue in scenario builder.
* Fix app model import error if screenshot can not be taken.
* Fix global variable reference error inside flow.
* Fix unhandled exception in file download in case of page error.
* Fix vuex.json rename error on some certain robots.
* Fix Write CSV execution error due to version conflicts.
* Fix frame name / id extraction error during web model import.

v1.6.7 (2020-09-30)
---

### Features
* Refactor the UI of scenario builder to improve design flexibility.
* Add comment step function to disable / enable steps.
* Enhance the display of param options for extension operations.
* Refactor the command generation machanism to enhance execution efficiency at robot side.
* Add `DataFrame` system operations to support large scale data table handling.
* Support `Save Image` command in GUI operations.
* Add device driver mode for system operation `Type Hotkey` to facilitate certain Windows apps.
* Support start app by ID for system operation `Start App`.

### Bug Fixes
* Fix invalid platform / browser combination task dispatching issue.
* Fix unhandled error on robot upon SWATHub server reboot.
* Fix workspace export failure issue due to missing resource files.

v1.6.6 (2020-08-28)
---

### Features
* Refactor web models and web operations to support both PC/Mobile browsers and Mobile webview apps.
* Upgrade SWATHub server infrastructure including Grails and libraries.
* Enhance @{param} denotations to support complex structure such as `@{var1.key1[var2]}`
* Support ignoreError for step diff operations.
* Support special keys and browser emulations for `Execute Webdriver Commands` system operation.
* Add robot version inside execution result.
* Add internal variables `${scenarionName}` and `${caseName}` in runtime execution.
* Support password processing for Excel relevant system oprations.

### Bug Fixes
* Fix task not able to be stopped on robot.
* Fix return value of `Get Credential` not be decrypted.
* Fix browser not able to be launched in page capture tool of robot.
* Fix web element sorting by sequence issue.
* Fix tooltip out of visible area on robot.
* Fix robot name with whitespaces issue.

v1.6.5 (2020-07-17)
---

### Features
* Refactor connection management mechanism between robot and server.
* Support mobile model on/off switch in server subscription.
* Add new system operations including `System Delay`, `Start Process` and `Close Process`.
* Add browser diagnosis at robot startup.
* Enhance error messages and dev guide for OS dependent system operations.
* Improve alert handling policy including JS injection and window switching.
* Set robot internal API port to be auto assigned.
* Support special keys in system operation `Type Hot Key`.
* Support started time and last updated time switching in robot task list.

### Bug Fixes
* Fix call extension and call JSON API error.
* Fix screenshot height issue for mobile webview app.
* Fix session not closed issue during multiple chrome parallel execution.
* Fix move / double click / right click issue on IE and Safari.
* Fix incorrect wait duration caused by setTimeout function on robot.
* Fix member not able to quit outdated workspace issue.

v1.6.4 (2020-05-15)
---

### Features
* Improve engine functions such as callouts, task timeout and step diff.
* Support new Edge Chromium browser.
* Refine robot packacking mechanism.
* Add new system operations including `Mobile Get Value`, `Execute Webdriver Commands` and `Execute Plugin`.
* Upgrade Jenkins plugin.
* Support PostgreSQL for database system operations.
* Refine task report mechanism to reduce database locking error.

### Bug Fixes
* Fix page capture file suffix issue for Chrome plugin.
* Fix source not found issue if new window displayed slowly.
* Fix page not captured issue for IE at robot side.

v1.6.3 (2020-03-31)
---
?> Important: Step option `compareScreenshot` and `compareScreenshotExclude` are NOT supported on robot with version `> 1.6.2`. Please use `stepDiff` instead.

?> Important: Matching rules are NOT supported for control operations such as If/Else or While on robot with version `> 1.6.2`. Please use JavaScript evaluations instead.

### Features
* Refactor engine into Node.js module.
* Enhance the step number naming mechanism.

### Bug Fixes
* Fix evidence upload failure after execution completed.
* Fix robot execution error due to white spaces in username on Windows.
* Fix mobile screenshot error before the form submit.
* Fix performance issue due to debug data transfer.
* Fix test case sync issue if interceptor exists.

v1.6.2 (2019-12-31)
---

### Features
* Enhance mobile app testing to support webview in hybrid apps.
* Add mobile system operations such as `Mobile Wait`, `Mobile Assert` and `Execute Mobile Command`.
* Refactor platform session control mechanism to support different browsers and apps in one scenario.
* Support SAP operations such as `Click`, `Type` and `Get Text` based on Windows operations.
* Display relative scenarios for any specific flow to improve package deployment.
* Add retry control in robot communication with SWATHub server.
* Enhance mouse actions in popup dialogs of SWATHub server.
* Refine VB scripts to avoid security alerts from anti-virus software.
* Enhance robot heartbeat mechanism to allow retrying on network issue.
* Auto-select the latest used robot as the default execution robot.

### Bug Fixes
* Fix `Get Credential` error on Win7 x86 systems.
* Fix incomplete sender email issue for exchange users for `Get Outlook Emails`.
* Fix SWATHub Enterprise package installation error due to Unix line ending.
* Fix robot engine api issue due to large packet size.

v1.6.1 (2019-11-08)
---

### Features
* Add mobile application model and support mobile automation.
* Support task debug function at robot side.
* Refactor model capture tool to support both browser and mobile apps.
* Enhance team collaboration to allow expired users to access valid workspaces.
* Add new built-in operations including `Start App` and `Record Screen`.
* Add timestamp into offline scenario package.

### Bug Fixes
* Fix task dispatching error if stopped.
* Fix task thread not terminated issue when stopped at robot side.
* Fix callout icon not displayed issue.
* Fix safari execution error on the latest iOS 13 devices.

v1.6.0 (2019-10-08)
---

### Features
* Refactor execution platform and task dispatching.
* Support extended platform definition on robot.
* Refine support for Microsoft Edge browser.
* Add multi-language support in robot GUI.
* Provide task stop function on robot side.
* Refine robot GUI display and error presentation.
* Enable robot settings update to be synchronized on SWATHub server side.
* Enhance extension service health monitoring and recovering.
* Add step logs for `Assign` operation.
* Add new built-in operations such as `Get POP3 Emails`, `Execute Excel Macro`, `Get from Clipboard` and `Type Hot Key`.
* Refine object location strategy for Windows operations.
* Add supplemental tools for IE auto-configuration and remote desktop disconnection.
* Enhance subscription display on SWATHub server side.
* Update statistics overview on user hompage and admin dashboard.

### Bug Fixes
* Fix robot black screen issue on Windows 32bit.
* Fix execution result display issue on robot because of incomplete steps data.
* Fix timezone issue in the log message operation.
* Fix json object validation issue with multiple lines.
* Fix 500 error if workspace not exists in URL.

v1.5.7 (2019-09-05)
---

### Features
* Enhance GUI and interactions of SWATHub Robot.
* Refactor SWATHub subscription architecture.
* Simplify the differences in UI of designers and testers.
* Enhances robot logs and separate task logs for each task execution.
* Refactor robot session management to remove browser limitation.
* Enhance the system operation - Log Message to dump log to a separate file.
* Provide command line tool to invoke a specific local task.
* Improve the operation tree in scenario builder.
* Enhance the cloud services in China, including domain name, robot download, switch from enterprise into cloud, and etc.

### Bug Fixes
* Fix script assertion issue in control steps.
* Fix unhandled error when file path not set in read csv extensions.

v1.5.6 (2019-08-09)
---

### Features
* Provide experimental SWATHub Robot in GUI mode, with addtional tools such as result viewers.
* Enhance Jenkins jobs to take consideration of GUI robots.
* Refactor scenario package structure to include default input.json.
* Add builtin system operations for native Windows app automation.
* Add OCR extensions for invoice recognition.
* Add stepOption `browserUseStatic` to generate commands based on static web models.

### Bug Fixes
* Fix robot connection error if server url with tabs.
* Fix user login error if managed robots set to 0.
* Fix rpa-cn connection error if robot is started with openjdk.

v1.5.5 (2019-07-08)
---

### Features
* Refactor architecture and display of system operations.
* Add flow control operation - `Assert` to verify a piece of JavaScript code.
* Enhance the database assertion rule editors.
* Add baseline function for execution results.
* Refactor the step options - `stepDiff` to compare step evidences.
* Add system variable `${lastAlertText}` to contain the display text of the last alert.
* Enhance excel read functions to return normalized array, and excel write functions based on native invocations.
* Enhance scenario builder to auto fillout the output arguments of flow and system operations.

### Bug Fixes
* Fix target not found issue in screenshot comparison with alert.
* Fix issue NaN or Infinity number can not be parsed as JSON.
* Fix scenario package not able to download when managed robots are enabled.

v1.5.4 (2019-06-07)
---

### Features
* Add a prototype tool for db diff rule generation.
* Add experimental extension for db assertion.
* Add a local result viewer to help onsite troubleshooting.
* Enhance command generation and add an experimental JVM argument `result.level` to adjust result memory usage.
* Add an experimential `ieOptions.compMode` to handle IE execution issue in compatibility mode and CORS.
* Ignore error evidence collection on the step with `ignoreError` enabled.
* Support `Add Stamp to PDF` extension.

### Bug Fixes
* Fix display issue in publishing the scenario package.
* Fix statistics display issue after license is imported.

v1.5.3 (2019-05-06)
---

### Features
* Add Robot Control Center funtions.
* Add experimental UiPath robot management functions.
* Refactor job and task dispatching.
* Refactor docker container architecture on SWATHub Cloud.
* Remove RabbitMQ container.
* Enhance scenario builder to make step title displayed right after modification.
* Support encrypted secure text handling in execution.
* Enable subscription auto detection on robot.
* Ignore `result.json` file dump into evidence if there's no output for an extension operation.
* Add `Get Credential` extension operation, and add `encoding` param into text and csv processing extensions.
* Enhance element locating strategy in web frameworks with dynamic ids.
* Add retry mechanism in case of selenium StaleElementReferenceException.

### Bug Fixes
* Fix job resume issue on legacy data.
* Fix data error for system parameter ${prevStepPath}.
* Fix step options missing in result diagnosis package.
* Fix browser emulations not activated in some specific errors.

v1.5.2 (2019-03-30)
---

### Features
* Refactor model import mechanism to abandon job dispatching.
* Distinguish scenario and case functions for business robot and testing robot.
* Add return value for API operations.
* Enhance display and filtering of the result tree.
* Add common templates for step options editor.
* Enable text write extension for testing robot.
* Set the title of the robot console.
* Enhance the error message of robot connection failure.

### Bug Fixes
* Fix unhandled alert error in Firefox browser.
* Fix cancel button link in the page of web model tuning.
* Fix logs not downloaded in the result diagnosis file under https SWATHub server.

v1.5.1 (2019-03-06)
---

### Features
* Enable extension operations for testing subscription.
* Refine system layout for scenarios, flows and models.
* Refactor the structure of online document.
* Add workspace export function for workspace owner.
* Enhance evidence collection and diagnosis package for GUI operations and extension operations.
* Add hide/show functions for GUI operations.
* Add Database, IMAP, JSON read/write and HTTP upload/download extensions.
* Add robot callouts to accept user input parameters for task execution.
* Add customized step options into the input file of offline execution.
* Adjust domain protocol to cope with robot https connection issue in special proxy environment.

### Bug Fixes
* Fix switch frame error in control operations.
* Fix `browserDownload` step options mili-seconds issue

v1.5.0 (2019-02-15)
---
?> Important: Offline packages with version `< 1.5.0` can NOT be executed on robot 1.5.0. The conversion service could be provided upon request.

?> Important: Due to the no variable policy of step options, please delete all the variables in step options if there is any in previous execution settings and step options,

### Features
* Refactor the structure of scenario package.
* Refactor the step options to integrate execution settings and legacy step options.
* Refactor the implementation of Extension Operation and support multi-language.
* Refine the concepts of Test Set and change it into Scenario Group.
* Add navigation mode in the scenario builder to facilitate the quick step location.
* Verify robot support on JRE 8 and OpenJDK 8.
* Remove the outdated tutorial quest functions.
* Enhance robot execution on MAC, including the web operation on Safari 12 and GUI operation on Retina screens.
* Improve robot download popup window.
* Support importing workspace from local file in case of error in file upload.
* Add Outlook send and receive extensions in [Email Automation](/en/extension-op.md#email-automation).

### Bug Fixes
* Fix upgrade icon display error after workspace imported.
* Fix operation sorting issue in template tuning panel.
* Fix offset area not set issue in getOCRText GUI command.

v1.4.5 (2018-01-04)
---
?> Important: SWATHub Robot 1.4.5 can NOT be upgraded from previous versions automatically, please [download and setup](/en/robot.md#installation) manually.

### Features
* Integrate SWATHub execution node and rpa robot into one [SWATHub Robot](/en/robot.md).
* Enhance online documents for GUI Operation, API Operation and SWATHub Robot.
* Add `stepCompare` execution setting to provide extensible step comparison with [reference sample](/en/extension-api.md#step-compare).
* Improve GUI operation editor with grouped commands.
* Add [PDF Processing](/en/robot/extension-op.md#pdf-processing) and [Log Message](/en/robot/extension-op.md#log-message) extensions.
* Upgrade Selenium version to 3.141.59.

v1.4.4 (2018-12-18)
---

### Features
* Add API operation to facilitate API testing.
* Add subscription management for GUI screens and API operations.
* Support GUI and API operations export/import.
* Enhance GUI automation on both operation design and task execution.
* Upgrade WebDrivers for multiple browsers.
* Improve memory consumption for execution results and logs.
* Add more [File Manipulation](/en/robot/extension-op.md#file-manipulation) extensions to support regular file and directory processing.
* Enhance robot extension error handling and documents.

### Bug Fixes
* Fix execution failure in proxy environment.
* Fix ssl security warnings on Chrome v70.

v1.4.3 (2018-11-06)
---

### Features
* Add experimental GUI automation powered by [SikuliX](http://sikulix.com/).
* Add new param type `JSON Array`, and improve the display of JSON editors.
* Enhance screenshot capture for the latest Safari 12.
* Improve wordings of user subscription page when the subscription is outdated.
* Enhance [Web Scraping](/en/robot/extension-op.md#web-scraping) extension to support extraction from all frames.
* Enhance [Send SMTP Mail](/en/robot/extension-op.md#send-smtp-mail) extension to add HTML format mails.

### Bug Fixes
* Fix log files not exported into diagnosis archive.
* Fix error display when execution settings are invalid during job creation.
* Fix step data of control operations not copied in the scenario builder.

v1.4.2 (2018-10-10)
---

### Features
* Add [Call JSON API](/en/buildin-op.md#call-json-api) system operation to invoke standard JSON APIs.
* Rename `Call API` system operation to be [Call Extension](/en/buildin-op.md#call-extension) to interact with SWATHub extensions and agent server.
* Add multiple [Robot Extensions](/en/robot/extension-op.md) into Scenario Builder which is available for `RPA` subscription only.
* Add [CSV Processing](/en/robot/extension-op.md#csv-processing) robot extension to read and write CSV text files.
* Improve Control Operations to work without browser session for some criterions.
* Enhance Microsoft Edge execution stablity.

### Bug Fixes
* Fix test cases sync error if output parameters exist.
* Fix test result status error due to control operations.
* Fix page parsing error for HTML with deep DOM architecture.

v1.4.1 (2018-08-25)
---

### Features
* Enable integration with Amazon SaaS Store.
* Selenium version upgraded to 3.13.0.
* Enable user subscription and remove workspace plan.
* Support both `RPA` and `Testing` subscriptions.
* Add `RPA` mode to execution node and support robot connection to SWATHub server.
* Remove GitHub signup and login.
* Disable simultaneous login for the same user on SWATHub cloud.
* Set self signed-up user to be disabled on SWATHub enterprise.
* Enhance SWATRobot extensions of excel reading and email processing.
* Enhance documents for array processing in the embedded [Javascript Engine](/en/scenario.md#script-text).
* Add demo videos with English subtitles into documents.
* Disable username edit on user profile page.
* Add information access term for execution diagnosis and template tuning service.

### Bug fixes
* Fix page verification in web page with multiple frames.
* Fix ${HTML} internal variable not result inside loops.
* Fix screenshot not taken if assertion failed.
* Fix diagnostic package download issue.
* Fix robot id generation issue in Linux.
* Fix scenario builder javascript compatibility issue on IE.

v1.4.0 (2018-06-29)
---

### Features
* Enhance SWATHub deployment procedure and update mechanism.
* Add new SWATRobot extensions for [Email Automation](/en/robot/extension-op.md#email-automation).
* Refine SWATRobot ID generation algorithm.
* Enhance SWATHub documents.

### Bug fixes
* Fix task code not displayed in failed execution on SWATRobot.
* Fix export issue in [Result Export](https://github.com/SmartekWorks/result-export).

v1.3.9 (2018-06-08)
---

### Features
* Add new argument type [Script Text](/en/scenario.md#arguments-data) which can execute Javascript and return data object.
* Add new flow control operation [Assign](/en/buildin-op.md#assign) which can create or update variables.
* Add [Output Arguments](/en/scenario.md#argument) for scenario and flow.
* Add new execution setting `ignoreError` which can continue the next step in case of execution error.
* Add new execution setting `compareScreenshotExclude` which can define regions not included in screenshot comparison.
* Enhance documents about [Session Control](/en/buildin-op.md#session-control) and data limitation in system operations.
* Upgrade Firefox Page Capture plugin to support browser versions greater than 59.
* Add [OCR](/en/robot/extension-op.md#sikulix-ocr) capability in robot extensions.

### Bug fixes
* Fix issue session id not set in [Call Extension](/en/buildin-op.md#call-extension).
* Fix issue error when the last window is closed by [Window Control](/en/buildin-op.md#window-control).

### Important!
* Case debug is disabled under refactoring and will be available in the future release.

v1.3.8 (2018-05-04)
---

### Features
* Add flow control operations including [If Else](/en/buildin-op.md#if-else), [While](/en/buildin-op.md#while) and [Try Catch](/en/buildin-op.md#try-catch).
* Enhance SWATHub online document with better style and full-text search support.
* Support multiple data types for internal variables, including `String`, `Integer`, `Boolean`, `Map` and `Array`.
* Support complex object access for internal variables, such as `@{var[1].attr2}`.
* Add `overwrite` mode for workspace import.
* Add `maxJobs` settings to limit the number of active jobs per workspace.
* Refine SWATHub Robot architecture and add scenario package version checking.
* Add multiple SWATHub Robot extensions, including [Web Scraping](/en/robot/extension-op.md#web-scraping), [Excel Processing](/en/robot/extension-op.md#excel-processing), [GUI Automation](/en/robot/extension-op.md#gui-automation), [System Invocation](/en/robot/extension-op.md#system-invocation) and [File Manipulation](/en/robot/extension-op.md#file-manipulation).

### Important!
* `repeatTimes` step option has been deprecated, please use [While](/en/buildin-op.md#while) flow control operation instead.

v1.3.7 (2018-03-25)
---

### Features
* Add new step option **Execution Settings**.
* Add new execution setting `pageSourceRefresh`, and add new value `middle` for execution setting `scrollIntoView`.
* Besides the new settings mentioned above, some execution settings are refactored in this version. The changes include: `elementWaitTimeout` and `enableAjaxWait` are removed, the default value of `commandInterval` and `operationInterval` are set to 0, the values of `compareScreenshot` are changed, and `capabilities` are renamed to `driverCapabilities`.
* New `JSON Parameter` is added for `Call API` system operation. The `Scraping` system operation is deprecated and recommended to use `Call API` instead.
* Refactor debug mode to share command generation with normal execution.
* Add SWATHub version into execution and page diagnosis file for SWATHub Enterprise.
* Update Jenkins plugin to support system variable and enhance test report.
* Update Chrome and Firefox web drivers.

### Bug fixes
* Fix issue frame elements can not be operated on Safari 11 using Javascript emulation.
* Fix issue `Browser Wait` system operation can not be executed due to upgrade.

### Important!
* The values of execution setting `compareScreenshot` are changed, with `assertAll` into `assert`, `verifyAll` into `verify`.


v1.3.6 (2018-02-07)
---

### Features
* Add command line mode for execution node.
* Add scenario package download function in test scenario overview page.
* Add `Scraping` system operation to fetch data from multiple web pages.
* Add wait until criterions to enhance `Browser Wait` system operation.
* Define scopes for windows and frames in matching rules.
* Add `sftp` mode to enhance evidence upload mechanism.
* Remove deprecated `Get Download` system operation without impacting exisiting scenarios.

### Bug fixes
* Fix issue task hung if evidence zip file not uploaded successfully.
* Fix issue page tuning hung if the json format of page template is invalid.

v1.3.5 (2018-01-05)
---

### Features
* Provide shared execution node across different workspaces.
* Add task timeout mechansim inside execution node.
* Support multiple window handling on Android and iOS devices.
* Improve execution stablility on Selenium 3 including screenshot taking, alert handling, file downloading and log display.
* Enhance documents to elaborate the current situation and limitation of different platforms on Selenium 2 and Selenium 3.
* Add notification mail templates in Japapnese.
* Add new execution setting `ieOptions:scriptType` to emulate text typing with Javascript.

v1.3.4 (2017-12-18)
---

### Features
* Provide execution node with Selenium 2 and with Selenium 3.
* Add `append` mode for workspace import which will append the different test ware into an existing workspace.
* The task control mechanism of execution node has been improved. The execution efficiency is increased, while the traffic between the execution node and SWATHub is decreased.
* The scheduling mechanism of execution has been improved. The efficiency of parallel exection is increased.
* Password input security warning in Firefox has been prevented in execution.

### Bug fixes
* Fix issue that user encount system error when accessing public workspace.
* Fix issue that duplicated variable has been exported in case exporting.
* Fix issue that system error occurs in when access specific workspace in administrator dashboard.

v1.3.3 (2017-10-13)
---

### Features
* Add execution start time and duration in the result overview dialog of the test case.
* Add execution start time and duration to the finished jobs and tasks.
* Add new page template settings `matchAllFrames` to match operation among all frames during page upgrade.
* Support screenshot auto merge for Android devices. Please be noted when `scrollableFrames` and `scrollableElements` are enabled, the dedicated images for frames or elements are not available, instead multiple full screenshots will be taken in order to display all areas of frames or elements.
* Add page information for each operation in the scenario summary.
* Enhance operation locating logs during case execution.
* Enhance documents for execution node setup and enterprise installation.
* Add monitoring API to display all connected execution nodes and their sessions.

### Bug fixes
* Fix issue default page template error for `mdl`.
* Fix issue screenshot can not be compared inside a flow.

v1.3.2 (2017-09-18)
---

### Features
* Provide an experimental Firefox plugin to support online HTML page tuning and capture, without saving as `shtm`. Please contact us for trial if you're interested.
* Add new execution setting `scrollIntoView` to provide more flexibility for element scrolling before interaction.
* Add offline installer of swat capture plugin for Chrome.
* Add wait overlay for web operations which last long time.
* Enhance IE execution stability by killing existing IE instances before launching.

### Bug fixes
* Fix issue node names different between page preview mode and tuning mode.
* Fix issue invited user can access workspace before confirmation.

### Important!
The execution setting `scrollToTop` is deprecated, and please use `scrollIntoView` instead.

v1.3.1 (2017-08-23)
---

### Features
* Add **Debug Mode** to improve test scenario building and debugging.
* Add **JIRA** integrations.
* Add new step option **AlertTimes** to handle multiple alert popups and set both AlertTimes and AlertTimeout as optional.
* Add `html` mode in [result export tool](https://github.com/SmartekWorks/result-export) to export evidences in HTML format.
* Enhance SWATHub API and Jenkins plugin to create an issue automatically in case of execution error.
* Set execution node to dump iedriver logs during IE execution.
* Confirm **Session Control** not supported on Edge browser and throw execution error accordingly.
* Update task activity checking mechanism to take **Browser Wait** into consideration.
* Enhance browser session creation mechasim in **Go to URL** system operation.
* Enhance workspace member management to allow addtion by username and operation in admin panel.
* Enhance execution settings for full desktop screenshot. Now if `fullScreenshot` is enabled but `fullScreenshotScroll` disabled, only one full screenshot will be taken right after the step is executed. If both settings are enabled, multiple screenshots will be taken if the web page is scrollable.
* Update Firefox detection mechanism for version `52+` on Windows platform.
* Update file download automation for Firefox version `52+`.

### Bug fixes
* Fix issue type long string in IE browsers by adding a new execution setting `ieOption.textMax`.
* Fix issue 500 error in SWATHub API call because of id type error.
* Fix issue always switchToDefaultContent in refreshWindow command.


v1.3.0 (2017-08-08)
---

### Features
* Add Redmine and Jenkins integrations.
* Change page rules to be page templages, and add default templates for popular frontend frameworks.
* Add `raw` mode in [result export tool](https://github.com/SmartekWorks/result-export) to export all evidences for any specified test results.
* Add [result merge tool](https://github.com/SmartekWorks/result-merge) to extract screenshots from several result files in Excel format and aggregate into one file.
* Add function to delete disabled workspaces permanently in SWATHub Enterprise.
* SWATHub home page and documentation refreshed.
* Cleanup noscript blocks before JSoup parsing.
* Upgrade WebDrivers for multiple browsers.
* Enhance page and flow filtering in the tree view.
* Enhance result diagnosis function in SWATHub Enterprise.
* Support frame/iframe execution for iOS devices.
* Add experimental execution settings `firefoxOptions` to cater for the evolving geckodriver.

### Bug fixes
* Fix issue parameters of interceptors not included in the sync Excel.
* Fix issue switch to default content before executing Javascript system operation.
* Fix issue too long parameter not breaked into multiple lines in test result page.
* Fix issue during Call API without browser session.
* Fix issue not to display step options or comments in the parameters upgrade list.
* Fix issue of element highlight error in page preview.
* Fix issue not able to get frame page source for Android devices.
* Fix issue not able to verify empty string in **Assertion** system operation.

v1.2.5 (2017-05-28)
---

### Features
* Support screenshot capture for the **scrollable elements** inside a frame.
* Enhance knowledge parsing to apply the preview rule of the template page as well.
* Save HTML source as evidence when `evidenceLevel` is `1`.
* Add new execution setting `alertScreenshot` to capture desktop fullscreeen shot before closing the alert window.
* Fix execute issue when browser window is closed by script.
* Add new execution setting `scrollToMiddle` to support all browsers, and deprecate the original IE only setting `ieOptions.scrollToMiddle`.
* Upgrade Chrome WebDriver to support the latest versions.

### Bug fixes
* Fix evidence export issue when the relative page is outdated.

v1.2.4 (2017-01-23)
---

### Features
* Add new SWATHub API to execute cases by IDs.
* Add new execution setting `screenshotScrollOffset` to capture web page with top floating bar.
* Add new execution setting `ieOptions.scrollToMiddle` to relocate the element to the middle of the screen before interaction for IE only.
* Add new execution setting `edgeOptions.basicAuthTimeout` to suppress the username and password dialog for Edge browser only.
* Enhance frame match mechanism during page upgrade and case execution, and update browser page capture plugins.
* Improve [result-export](https://github.com/SmartekWorks/result-export) tool to support both single & batch results export.

### Bug fixes
* Fix display issues in admin dashboard and result view.

v1.2.3 (2016-12-07)
---

### Features
* Add standalone page capture tool.
* Experimentally introduce geckodriver to support Firefox in version above `47`.
* Add new execution setting `compareScreenshot` to deprecate the existing settings on scenario steps.
* Improve the workspace main menu and add navigation to the scenario title in the flow builder.
* Sort out the existing SWATHub tools and samples for user references.
* Change the default behavior upon an unhandled alert to be dismissal, instead of acception.

### Bug fixes
* Fix workspace import issue because of no case revisions.

v1.2.2 (2016-10-31)
---

### Features
* Support the latest iOS10 real devices.
* Add test case revision mechanism.
* Add execution settings definition in Jenkins plugin.
* Adjust screenshot comparison priority over evidence level settings.

### Bug fixes
* Fix export issue for test scenarios and cases with duplicate names.

v1.2.1 (2016-09-27)
---

### Features
* Support page zoom in/out in the knowledge preview module.
* Support element preview of page operations in the scenario builder.
* Add update alert before leaving the scenario builder.
* Add execution platform information in the case result list view.
* Support auto file download on Windows Edge browser.
* Assign title to the console of the local execution node on Windows.

### Bug fixes
* Fix menu not refresh issue for scenario search and operation disable functions.

v1.2.0 (2016-08-31)
---

### Features
* Support Microsoft Edge on local execution node.
* Support workspace disable / enable in SWATHub enterprise.
* Improve SWATHub API and sample [testset export tool](https://github.com/SmartekWorks/testset-export) on Github.
* Add tag and status filtering for result export and update [sample tool](https://github.com/SmartekWorks/platform-export) on Github.
* Enable file download automation on Safari.
* Support operation select-all / deselect-all in the page tree.
* Increase JAVA heap size of SWATHub server in the enterprise docker container.

### Bug fixes
* Fix download error of test results' diagnosis report.

v1.1.9 (2016-08-03)
---

### Features
* Support screenshot diff mechanism.
* Provide test evidence collection function for technical support.
* Update SWAT API and provide open source scenario export tool.
* Add new command `scriptClick` using JS to simulate click action.
* Selenium version upgraded to 2.53.1.
* JSoup version upgraded to 1.9.2 to improve HTML parsing efficiency.

v1.1.8 (2016-07-01)
---

### Features
* Support flow editing inside the scenario builder.
* Provide knowledge tree width tuning in the scenario builder.
* Add active user filtering in the admin dashboard.
* Add data backup and restore scripts for SWATHub Enterprise.
* Auto parameterize page operation when added into scenario builder.
* Display step comment as popup tooltip in the scenario builder.
* Mark job progress bar as red if any task failed.
* Check step option parameters during command generation.

v1.1.7 (2016-05-31)
---

### Features
* Add test scenario summary into the Case Export Excel file.
* Raise the concurrent execution sessions for SWATHub Enterprise.
* Add one more `evidenceLevel` as `0` which will not capture any screenshots except error.

v1.1.6 (2016-04-18)
---

### Features
* Introduce new step options `download prompt timeout` and `download complete timeout` to automate file download, which will deprecate the `Get Download` system operation.
* Add new execution setting `enableByCSS` to locate element in non-standard HTML.


v1.1.5 (2016-04-01)
---

### Features
* Add new execution setting `fullScreenshot` to take desktop fullscreen capture.
* Selenium version upgraded to 2.53.0.
* JSoup version upgraded to 1.8.3 to improve HTML parsing efficiency.

v1.1.4 (2016-03-23)
---

### Features
* Add result export tool to combine execution evidences on different platforms.
* Add new command `tripleClick`.
* Add new execution setting `ieOptions` to cater for IE specific issues.
* Fine tune cleanup job interval.

v1.1.3 (2016-02-25)
---

### Features
* Add PostGre SQL support for SWATHub Enterprise.
* Add VMWare/ESXi installation image support for SWATHub Enterprise.
* Add global page amount limitation in license mechanism for SWATHub Enterprise.
* Selenium version was upgraded to 2.52.0 for SWATHub execution.
* Enhance workspace statistices.

v1.1.2 (2015-12-30)
---

### Features
* Add comment system for scenario steps and test results.
* Improve job loading mechanism.

v1.1.1 (2015-12-09)
---

### Features
* Workspace export and import.
* Add rule editor for matching rules.

v1.1.0 (2015-11-27)
---

### Features
* Add step iteration support for test scenarios and flows.
* Add public mode for workspace to allow guests' / non-members' access.
* Add test results auto deletion mechanism.
* Add base API server url.
* Add mail service retry mechanism in case of network error.

v1.0.9 (2015-11-20)
---

### Features
* Add execution result report by email.
* Add retry mechanism for waas api.
* Enhance evidence and log handling logic.
* Enhance storage calculation for mass test results.
* Improve parameter settings for system operations in scenario builder.

v1.0.8 (2015-10-30)
---

### Features
* Test case export/import and data synchronization with Excel files.
* Add auto validation for runtime variables.
* Add wait timeout for dynamic elements in matching rules.
* Add test server definition in Jenkins plugin and support one job with cases from multiple test sets.
* Selenium version was upgraded to 2.48 for SWATHub execution.
* Enhance execution stability including node heartbeating, task polling, screenshot taking and message retry mechanism.

v1.0.7 (2015-10-12)
---

### Features
* Add recent Test Sets for quick navigation.
* Workspace navigation removed from header area.
* Test Set / Test Scenario sorting updated.
* Password forget process improved.
* Step ignoring mechanism enhanced.

v1.0.6 (2015-09-24)
---

### Features
* Add Japanese homepage for enterprise edition.
* Add step duplication in scenario builder.
* Improve filtering mechanism for scenarios, jobs and testsets.
* Improve UI experience in scenario builder.
* Enhance Jenkins plugin by adding tags filter.
* Improve logging for system operation - assertion.

v1.0.5 (2015-09-15)
---

### Features
* Add email notification.
* Add integration to Lesschat and HiWork.

v1.0.4 (2015-09-09)
---

### Features
* SWATHub step-by-step tutorials were setup.
* Japanese documentation was added.

v1.0.3 (2015-08-31)
---

### Features
* Batch GUI operations were introduced, such as exporting multiple cases' evidence, archiving multiple scenarios/cases and so on.
* Complete support for Chrome options to emulate full-scale Chrome browser behaviors.
* Jenkins plugin improved to support master-slave architecture.
* Javascript console logs and internal variables were enabled for execution.

v1.0.2 (2015-08-13)
---

### Features
* Japanese language was supported in SWATHub website.
* Windows 10 support for local execution nodes. The Web Driver for Windows Edge browser was still under development and will be supported after its stable release.
* Selenium version was upgraded to 2.47 for SWATHub execution.
* Execution job dispatching mechanism was improved.
* Jenkins plugin updated to support proxy configuration.

v1.0.1 (2015-07-29)
---

### Features
* The maintenance (backup/restore/upgrade) of SWATHub Enterprise version was improved.
* DB query was updated to improve stability.

v1.0.0 (2015-07-22)
---

### Features
* The first GA version was released!
