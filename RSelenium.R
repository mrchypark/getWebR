library(RSelenium)
pJS <- wdman::phantomjs(port = 4567L)
remDr <- remoteDriver(port=4567L, browserName = 'phantomjs')
remDr$open()
remDr$navigate("http://www.google.com/ncr")
remDr$screenshot(display = T)

webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("R Cran"))
remDr$screenshot(display = T)

webElem$sendKeysToElement(list(key = "enter"))
remDr$screenshot(display = T)

webElems <- remDr$findElements(using = 'css selector', "h3.r")
resHeaders<-unlist(lapply(webElems, function(x){x$getElementText()}))
resHeaders

remDr$mouseMoveToLocation(webElement = webElems[[1]])
remDr$click(1)
remDr$screenshot(display = T)
remDr$getCurrentUrl()

remDr$getTitle()[[1]]
remDr$close()
pJS$stop()
