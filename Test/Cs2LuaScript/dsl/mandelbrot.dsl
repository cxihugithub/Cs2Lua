require("cs2lua__utility");
require("cs2lua__namespaces");
require("cs2lua__externenums");
require("cs2lua__interfaces");

class(Mandelbrot) {
	static_methods {
		__new_object = function(...){
			return(newobject(Mandelbrot, typeargs(), typekinds(), null, null, ...));
		};
		cctor = function(){
		};
	};
	static_fields {
	};
	static_props {};
	static_events {};

	instance_methods {
		Start = function(this, obj, mb){
			setinstance(this, "root", newexternobject(UnityEngine.GameObject, typeargs(), typekinds(), , null, "mandelbrot"));
			callinstance(this, "Exec");
		};
		Call = function(this, name, ...){
			local{args = params(0);};
		};
		Exec = function(this){
			local(width); width = 50;
			local(height); height = width;
			local(maxiter); maxiter = 50;
			local(limit); limit = 4.00;
			local(y); y = 0;
			while( execbinary("<", y, height, System.Int32, System.Int32, TypeKind.Struct, TypeKind.Struct) ){
				local(Ci); Ci = execbinary("-", execbinary("/", execbinary("*", 2.00, y, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), height, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), 1.00, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct);
				local(x); x = 0;
				while( execbinary("<", x, width, System.Int32, System.Int32, TypeKind.Struct, TypeKind.Struct) ){
					local(Zr); Zr = 0.00;
					local(Zi); Zi = 0.00;
					local(Cr); Cr = execbinary("-", execbinary("/", execbinary("*", 2.00, x, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), width, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), 1.50, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct);
					local(i); i = maxiter;
					local(isInside); isInside = true;
					do{
						local(Tr); Tr = execbinary("+", execbinary("-", execbinary("*", Zr, Zr, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), execbinary("*", Zi, Zi, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), Cr, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct);
						Zi = execbinary("+", execbinary("*", execbinary("*", 2.00, Zr, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), Zi, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), Ci, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct);
						Zr = Tr;
						if( execbinary(">", execbinary("+", execbinary("*", Zr, Zr, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), execbinary("*", Zi, Zi, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), System.Double, System.Double, TypeKind.Struct, TypeKind.Struct), limit, System.Double, System.Double, TypeKind.Struct, TypeKind.Struct) ){
							isInside = false;
							break;
						};
					}while(execbinary(">", (function(){ i = execbinary("-", i, 1, System.Int32, System.Int32, TypeKind.Struct, TypeKind.Struct); return(i); })(), 0, System.Int32, System.Int32, TypeKind.Struct, TypeKind.Struct));
					if( isInside ){
						callinstance(this, "DrawCube", x, y, width, height);
					};
				x = execbinary("+", x, 1, System.Int32, System.Int32, TypeKind.Struct, TypeKind.Struct);
				};
			y = execbinary("+", y, 1, System.Int32, System.Int32, TypeKind.Struct, TypeKind.Struct);
			};
		};
		DrawCube = function(this, x, y, w, h){
			local(cube); cube = callstatic(UnityEngine.GameObject, "CreatePrimitive", 3);
			setinstance(getinstance(cube, "transform"), "position", newexternobject(UnityEngine.Vector3, typeargs(), typekinds(), , null, execbinary("/", execbinary("*", execbinary("*", x, getinstance(this, "r"), System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), getinstance(this, "scale"), System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), w, System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), execbinary("-", execbinary("/", execbinary("*", execbinary("*", y, getinstance(this, "r"), System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), getinstance(this, "scale"), System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), h, System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), 12, System.Single, System.Single, TypeKind.Struct, TypeKind.Struct), 0));
			callinstance(getinstance(cube, "transform"), "SetParent", getinstance(getinstance(this, "root"), "transform"));
			local(mat); mat = getinstance(callinstance(cube, "GetComponent", UnityEngine.Renderer), "material");
			local(ix); ix = callstatic(UnityEngine.Random, "Range", 0, getinstance(getinstance(this, "colors"), "Length"));
			setinstance(mat, "color", getinstance(this, "colors")[ix + 1]);
		};
		ctor = function(this){
		};
	};
	instance_fields {
		root = null;
		colors = buildarray(UnityEngine.Color, getstatic(UnityEngine.Color, "red"), getstatic(UnityEngine.Color, "blue"), getstatic(UnityEngine.Color, "green"), getstatic(UnityEngine.Color, "cyan"), getstatic(UnityEngine.Color, "grey"), getstatic(UnityEngine.Color, "white"), getstatic(UnityEngine.Color, "yellow"), getstatic(UnityEngine.Color, "magenta"), getstatic(UnityEngine.Color, "black"));
		r = 10;
		scale = 3.00;
	};
	instance_props {};
	instance_events {};

	interfaces {
		"IStartupPlugin";
	};
	interface_map {
		IStartupPlugin_Start = "Start";
		IStartupPlugin_Call = "Call";
	};

	class_info(TypeKind.Class, Accessibility.Internal) {
	};
	method_info {
		Start(MethodKind.Ordinary, Accessibility.Public){
		};
		Call(MethodKind.Ordinary, Accessibility.Public){
		};
		Exec(MethodKind.Ordinary, Accessibility.Private){
		};
		DrawCube(MethodKind.Ordinary, Accessibility.Private){
		};
		ctor(MethodKind.Constructor, Accessibility.Public){
		};
	};
	property_info {};
	event_info {};
	field_info {
		root(Accessibility.Private){
		};
		colors(Accessibility.Private){
		};
		r(Accessibility.Private){
		};
		scale(Accessibility.Private){
		};
	};
};
comment("Mandelbrot.Exec();");



