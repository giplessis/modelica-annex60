within Annex60.Experimental.Benchmarks.Utilities.FunctionsInlined;
function spliceFunctionInline "Spline interpolation of two functions"
  extends Modelica.Icons.Function;
  input Real pos "Returned value for x-deltax >= 0";
  input Real neg "Returned value for x+deltax <= 0";
  input Real x "Function argument";
  input Real deltax=1 "Region around x with spline interpolation";
  output Real out;
algorithm
  out := (pos-neg)*(if x/deltax <= -0.999999999 then 0 elseif x/deltax >= 0.999999999 then 1 else (Modelica.Math.tanh(Modelica.Math.tan(x/deltax*Modelica.Math.asin(1))) + 1)/2) + neg;

  annotation (Inline = true,
              derivative=Modelica.Media.Air.MoistAir.Utilities.spliceFunction_der,
    Documentation(revisions="<html>
<ul>
<li>
December 28, 2015, by Marcus Fuchs:<br/>
Change of code as suggested by Filip Jorissen.
</li>
</ul>
</html>"));
end spliceFunctionInline;
