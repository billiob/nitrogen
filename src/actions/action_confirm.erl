% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (action_confirm).
-include ("wf.inc").
-compile(export_all).

render_action(Record) -> 
	TriggerPath = Record#confirm.trigger,
	TargetPath = Record#confirm.target,
	Postback = wf_event:generate_postback_script(Record#confirm.postback, confirm, TriggerPath, TargetPath, undefined),
	[
		wf:f("if (confirm(\"~s\")) {", [wf:js_escape(Record#confirm.text)]),
			Postback, Record#confirm.actions,
		"}"
	].
	