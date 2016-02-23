
#|

Note that every request unambiguously identifies both participants. 


(ensure record) ->
(ensure record)

(insert record) ->
(ensure record)

(select filter) ->
(ensure record)*

(delete filter) ->
(delete filter)*

(update filter record) ->
(ensure record)*



;; SUBSCRIPTIONS
; subscription

(subscribe filter) 
->
(accept filter) 
(clock sts)
(ensure record)*

; remove subscription
(subscribe nil) 
->
(clock sts)

; full sync subscription
(subscribe t) 
->
(accept t)
(clock sts)
(ensure record)*

; create subscription on client:
(accept t) 
(clock cts)
(ensure record)*
->
(subscribe t)


; changes from - to, server initiated
(since sts0) 
(clock sts1)
(ensure record)*
(delete filter)*
<-
t

; changes from - to, client initiated
(since cts0)
(clock cts1)
(ensure record)*
(delete filter)*
->
t

SO....What do we have to implement??

Client and server implement the same!
Also, one code base! 

Data per friend:
(subscription (filter*) sync-ts) ; sync-ts is the local ts until which the remote has all data
(acception (filter*) sync-ts) ; sync-ts is the remote ts until which the local has all data






|#




(ql:quickload :clack)
(ql:quickload :alexandria)
(ql:quickload :ningle)


(defvar *app* (make-instance 'ningle:<app>))

(setf (ningle:route *app* "/")
      "Welcome to api4!")

(setf (ningle:route *app* "/instruction" :method :GET)
      #'(lambda (params)
	  (prin1-to-string params)))



(clack:clackup *app*)

