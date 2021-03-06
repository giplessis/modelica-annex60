within Annex60.Fluid.MixingVolumes.Validation;
model MixingVolumeTraceSubstanceReverseFlow
  "Test model for mixing volume with trace substance input and flow reversal"
  extends Modelica.Icons.Example;
 package Medium = Annex60.Media.Air(extraPropertiesNames={"CO2"})
    "Medium model";

  parameter Modelica.SIunits.Pressure dp_nominal = 10 "Nominal pressure drop";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 2.0
    "Nominal mass flow rate";

  Modelica.Fluid.Sources.MassFlowSource_T sou(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow_nominal,
    use_m_flow_in=true,
    T=313.15) "Flow source and sink"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Sources.Boundary_pT bou(
    redeclare package Medium = Medium,
    T=303.15,
    nPorts=2) "Boundary condition"
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-20})));
  Annex60.Fluid.MixingVolumes.MixingVolume volDyn(
    redeclare package Medium = Medium,
    V=1,
    nPorts=2,
    m_flow_nominal=m_flow_nominal,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    use_C_flow=true) "Volume with dynamic balance"
    annotation (Placement(transformation(extent={{10,0},{30,20}})));

  Modelica.Blocks.Math.Gain        C_flow(k=1/1000)
    "Trace substance mass flow rate"
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Fluid.Sources.MassFlowSource_T sou1(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow_nominal,
    use_m_flow_in=true,
    T=313.15) "Flow source and sink"
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Annex60.Fluid.MixingVolumes.MixingVolume volSte(
    redeclare package Medium = Medium,
    V=1,
    nPorts=2,
    m_flow_nominal=m_flow_nominal,
    use_C_flow=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Volume with steady-state balance"
    annotation (Placement(transformation(extent={{10,-50},{30,-30}})));
  Modelica.Blocks.Sources.Ramp m_flow(
    height=-2*m_flow_nominal,
    duration=10,
    offset=m_flow_nominal) "Mass flow rate"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(sou.ports[1], volDyn.ports[1]) annotation (Line(points={{-20,6.66134e-16},
          {-6,6.66134e-16},{-6,-5.55112e-16},{18,-5.55112e-16}},   color={0,127,
          255}));
  connect(C_flow.y, volDyn.C_flow[1]) annotation (Line(points={{-19,40},{-10,40},
          {-10,4},{8,4}},   color={0,0,127}));
  connect(sou1.ports[1], volSte.ports[1])
    annotation (Line(points={{-20,-50},{18,-50}},          color={0,127,255}));
  connect(C_flow.y, volSte.C_flow[1]) annotation (Line(points={{-19,40},{-10,40},
          {-10,-46},{8,-46}},   color={0,0,127}));
  connect(volSte.ports[2], bou.ports[1]) annotation (Line(points={{22,-50},{22,-60},
          {40,-60},{40,-22},{60,-22}}, color={0,127,255}));
  connect(volDyn.ports[2], bou.ports[2]) annotation (Line(points={{22,0},{22,-10},
          {40,-10},{40,-18},{60,-18}}, color={0,127,255}));
  connect(sou.m_flow_in, m_flow.y) annotation (Line(points={{-40,8},{-48,8},{-48,
          0},{-59,0}}, color={0,0,127}));
  connect(m_flow.y, sou1.m_flow_in) annotation (Line(points={{-59,0},{-48,0},{-48,
          -42},{-40,-42}}, color={0,0,127}));
  connect(m_flow.y, C_flow.u) annotation (Line(points={{-59,0},{-48,0},{-48,40},
          {-42,40}}, color={0,0,127}));
  annotation (Documentation(
        info="<html>
<p>
This model demonstrates the use of the mixing volume with air flowing into and out of the volume
and trace substances added to the volume.
</p>
<p>
The model <code>volDyn</code> uses a dynamic balance,
whereas the model <code>volSte</code> uses a steady-state balance.
The mass flow rate starts positive and reverses its direction at <i>t=5</i> seconds.
</p>
</html>", revisions="<html>
<ul>
<li>
January 19, 2016, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
 __Dymola_Commands(file="modelica://Annex60/Resources/Scripts/Dymola/Fluid/MixingVolumes/Validation/MixingVolumeTraceSubstanceReverseFlow.mos"
        "Simulate and plot"),
    experiment(StopTime=10),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})));
end MixingVolumeTraceSubstanceReverseFlow;
