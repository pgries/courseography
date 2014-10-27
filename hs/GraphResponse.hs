{-# LANGUAGE OverloadedStrings #-}

module GraphResponse where
import Data.List
import           Text.Blaze ((!))
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Happstack.Server
import MakeElements
import MasterTemplate

graphResponse :: ServerPart Response
graphResponse =
   ok $ toResponse $
    masterTemplate "Courseography - SVG serving test!"
                [H.meta ! A.name "keywords"
                        ! A.content "",
                 plannerLinks
                ]
                (do header "graph"
                    createTag H.div "graph" "graph" $ do
                        ""
                    createTag H.div "" "infoTabs" $ do
                        tabList $ do
                            welcomeTab
                            timetableTab
                )
                plannerScripts


plannerScripts :: H.Html
plannerScripts = concatHtml (map makeScript["http://code.jquery.com/jquery-1.10.2.js",
                                           "http://code.jquery.com/ui/1.10.4/jquery-ui.js",
                                           "static/js/graph/modal.js",
                                           "static/js/graph/objects/edge.js",
                                           "static/js/graph/objects/node.js",
                                           "static/js/common/objects/course.js",
                                           "static/js/common/cookieHandler.js",
                                           "static/js/graph/tabs/setup_tabs.js",
                                           "static/js/graph/utilities/course_description.js",
                                           "static/js/graph/tabs/feedback_form.js",
                                           "static/js/graph/tabs/focuses.js",
                                           "static/js/graph/tabs/post.js",
                                           "static/js/graph/tabs/timetable.js",
                                           "static/js/graph/tabs/fce_count.js",
                                           "static/js/common/objects/section.js",
                                           "static/js/common/utilities/util.js",
                                           "static/js/graph/utilities/structs.js",
                                           "static/js/graph/utilities/util.js",
                                           "static/js/graph/create_data.js",
                                           "static/js/graph/parse_graph.js",
                                           "static/js/graph/mouse_events.js",
                                           "static/js/graph/setup.js"])


tabList :: H.Html -> H.Html
tabList content = createTag H.div "" "tabListDiv" $ do
                  createTag H.ul "" "tabList" $ do
                      createTag H.li "" "" $ do
                          makeA "" "" "#welcome" "" $ do
                              "Welcome!"
                      createTag H.li "" "" $ do
                          makeA "" "" "#focuses" "" $ do
                              "Focuses"
                      createTag H.li "" "" $ do
                          makeA "" "" "#timetable" "" $ do
                              "Timetable"
                      createTag H.li "" "" $ do
                          makeA "" "" "#post" "" $ do
                              "Check My POSt!"
                      do content

                  createTag H.div "FCECountDiv" "" $ do
                      createTag H.span "FCEcount" "" $ do "0.0"
                  "FCEs" -- Being difficult. Won't show up correctly.

welcomeTab :: H.Html
welcomeTab = createTag H.div "welcome" "infoTab" $ do
                     createTag H.div "" "infoTabContent" $ do
                         createTag H.h2 "" "" $ do "Welcome!"
                         createTag H.p "" "" $ do
                             "The graph above displays the prerequisite links connecting courses"
                             "in our department. Select courses to plan your enrolments for"
                             "future terms! Courses that you've selected but have missing"
                             "prerequisites will be highlighted in red."

                         createTag H.p "" "" $ do
                             "Check out the different tabs to access helpful features for your"
                             "planning. Also, here's a"
                             makeA "" "" "res/full_graph.jpg" "_blank" $ do "printable version"
                             "of the graph."

                         --createTag H.br "" ""
                         createTag H.p "" "" $ do
                             "Courseography is an ongoing "
                             makeA "" "" "https://github.com/Ian-Stewart-Binks/courseography" "_blank" $ do "project "
                             "maintained by Ian Stewart-Binks and"
                             makeA "" "" "http://www.cs.toronto.edu/~liudavid/" "_blank" $ do " David Liu "
                             "."
                             "Ideas for new features, better design, and (especially) bug reports"
                             "are always welcome!"
                             "Please send all feedback to"
                             makeA "" "" "mailto:cs.toronto.courseplanner@gmail.com" "_blank" $ do " this address "
                             "."
                             "If you see a bug, please do let us know which browser and version you're using."
                             "And if there's a display issue, giving us your screen display info"
                             "(e.g., resolution) will be rather helpful. Thanks!"

focusesTab :: H.Html
focusesTab = ""

timetableTab :: H.Html
timetableTab = createTag H.div "timetable" "infoTab" $ do
                           createTag H.div "timetableSearch" "infoTabContent" $ do
                               createTag H.h2 "" ""  $ do
                                   "2014-2015 Timetable"
                               createTag H.p "" "" "Search through the timetable for a course or instructor."
                               createTag H.p "" "" "The \"(+5)\" caps are extra reserved seats. See official timetable for details."
                               createTag H.p "timetable-creator-link" "" $ do
                                   makeA "" "" "timetable_creator.html" "" $ do
                                       "Plan your timetable here!"
                               makeInput "filter" "text-input" "" "" "text"
                           createTag H.div "timetableContainer" "" $ do
                               ""

checkMyPostTab :: H.Html
checkMyPostTab = ""