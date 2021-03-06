within Annex60.Utilities.Psychrometrics.Functions;
function saturationPressure
  "Saturation curve valid for 223.16 <= T <= 373.16 (and slightly outside with less accuracy)"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Temperature TSat(displayUnit="degC",
                                          nominal=300) "Saturation temperature";
  output Modelica.SIunits.AbsolutePressure pSat(
                                          displayUnit="Pa",
                                          nominal=1000) "Saturation pressure";

algorithm
  pSat := Annex60.Utilities.Math.Functions.spliceFunction(
             Annex60.Utilities.Psychrometrics.Functions.saturationPressureLiquid(TSat),
             Annex60.Utilities.Psychrometrics.Functions.sublimationPressureIce(TSat),
             TSat-273.16,
             1.0);
  annotation(Inline=true,
    smoothOrder=1,
    Documentation(info="<html>
<p>
Saturation pressure of water, computed from temperature,
according to Wagner <i>et al.</i> (1993).
The range of validity is between
<i>190</i> and <i>373.16</i> Kelvin.
</p>
<h4>References</h4>
<p>
Wagner W., A. Saul, A. Pruss.
 <i>International equations for the pressure along the melting and along the sublimation curve of ordinary water substance</i>,
equation 3.5. 1993.
<a href=\"http://www.nist.gov/data/PDFfiles/jpcrd477.pdf\">
http://www.nist.gov/data/PDFfiles/jpcrd477.pdf</a>.
</p>
</html>",
revisions="<html>
<ul>
<li>
August 19, 2015 by Michael Wetter:<br/>
Changed <code>smoothOrder</code> from <i>5</i> to <i>1</i> as
<a href=\"modelica://Annex60.Utilities.Math.Functions.spliceFunction\">
Annex60.Utilities.Math.Functions.spliceFunction</a> is only once
continuously differentiable.
Inlined the function.
</li>
<li>
November 20, 2013 by Michael Wetter:<br/>
First implementation, moved from <code>Annex60.Media</code>.
</li>
</ul>
</html>"));
end saturationPressure;
