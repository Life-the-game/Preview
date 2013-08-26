(* ************************************************************************** *)
(* Project: Life - the game, Preview Website                                  *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/Preview         *)
(* ************************************************************************** *)

open Eliom_registration.Html5
open Eliom_content.Html5.F
open Eliom_parameter
open Eliom_service

let _ =
  register
    ~service:(service ~path:[] ~get_params:unit ())
    (fun () () ->
      let serv = external_service ~prefix:"http://about.life.tl"
	~path:[] ~get_params:unit () in
      Lwt.return
	(html
	   (head (title (pcdata "Life - the game"))
	      [css_link ~uri:(make_uri (Eliom_service.static_dir ())
				["style.css"]) ()])
	   (body [h1 [pcdata "Life"; small [pcdata "- the game"]];
		  h2 [pcdata "Coming Soon"];
		  a ~service:serv [h3 [pcdata "Learn more →"]] ()])))
