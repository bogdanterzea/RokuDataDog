' Copyright 2021 EPIX Entertainment LLC
'
' Licensed under the Apache License, Version 2.0 (the "License");
' you may not use this file except in compliance with the License.
' You may obtain a copy of the License at
'
'     http://www.apache.org/licenses/LICENSE-2.0
'
' Unless required by applicable law or agreed to in writing, software
' distributed under the License is distributed on an "AS IS" BASIS,
' WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
' See the License for the specific language governing permissions and
' limitations under the License.

sub init()
    TRY
        explodingMethod()
    CATCH error
        dataDogTracker = CreateObject("roSGNode", "dataDogTracker")
        dataDogTrackerConfig = dataDogTracker.callFunc("createDataDogConfiguration", "[application_id]", "[application_token]")
        dataDogTracker.callFunc("setConfiguration", dataDogTrackerConfig)
        dataDogTracker.callFunc("sendError", error)
    end TRY
end sub

sub explodingMethod()
    x = 1
    ? x.foo
end sub
