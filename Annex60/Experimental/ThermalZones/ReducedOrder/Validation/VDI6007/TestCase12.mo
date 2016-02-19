within Annex60.Experimental.ThermalZones.ReducedOrder.Validation.VDI6007;
model TestCase12 "VDI 6007 Test Case 12 model"
  package Medium = Annex60.Media.Air "Medium model";

  ROM.ThermalZoneTwoElements thermalZoneTwoElements(
    VAir=52.5,
    alphaExt=2.7,
    alphaWin=2.7,
    gWin=1,
    nExt=1,
    alphaRad=5,
    nInt=1,
    AWin=0,
    AExt=10.5,
    AInt=75.5,
    alphaInt=2.24,
    RWin=0.00000001,
    volAir(X_start={0,0}),
    RExt={0.00436791293674},
    RExtRem=0.03895919557,
    CExt={1600848.94},
    RInt={0.000595693407511},
    CInt={14836354.6282},
    ATransparent=7,
    ratioWinConRad=0.09,
    nPorts=2,
    T_start=294.65)
    annotation (Placement(transformation(extent={{44,-2},{92,34}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{8,-6},{20,6}})));
  Modelica.Thermal.HeatTransfer.Components.Convection       thermalConductorWall
    annotation (Placement(transformation(extent={{36,6},{26,-4}})));
  Modelica.Blocks.Sources.CombiTimeTable internalGains(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    table=[0,0,0,0; 3600,0,0,0; 7200,0,0,0; 10800,0,0,0; 14400,0,0,0; 18000,0,0,
        0; 21600,0,0,0; 25200,0,0,0; 25200,80,80,200; 28800,80,80,200; 32400,80,
        80,200; 36000,80,80,200; 39600,80,80,200; 43200,80,80,200; 46800,80,80,
        200; 50400,80,80,200; 54000,80,80,200; 57600,80,80,200; 61200,80,80,200;
        61200,0,0,0; 64800,0,0,0; 72000,0,0,0; 75600,0,0,0; 79200,0,0,0; 82800,
        0,0,0; 86400,0,0,0],
    columns={2,3,4})
    annotation (Placement(transformation(extent={{6,-60},{22,-44}})));
  Modelica.Blocks.Sources.CombiTimeTable reference(
    tableOnFile=false,
    columns={2},
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    table=[3600,21.5; 7200,21.2; 10800,21; 14400,20.9; 18000,21; 21600,21.3;
        25200,21.9; 28800,24.1; 32400,24; 36000,24.4; 39600,24.8; 43200,25.1;
        46800,25.4; 50400,25.5; 54000,25.7; 57600,26.3; 61200,26.3; 64800,25.2;
        68400,25; 72000,24.7; 75600,24.3; 79200,24; 82800,23.8; 86400,23.6;
        781200,29.1; 784800,28.7; 788400,28.5; 792000,28.3; 795600,28.3; 799200,
        28.6; 802800,29.1; 806400,31.8; 810000,31.7; 813600,32; 817200,32.3;
        820800,32.6; 824400,32.8; 828000,32.9; 831600,33; 835200,33.6; 838800,
        33.5; 842400,31.8; 846000,31.5; 849600,31.1; 853200,30.7; 856800,30.3;
        860400,30.1; 864000,29.8; 5101200,30.5; 5104800,30; 5108400,29.8;
        5112000,29.6; 5115600,29.6; 5119200,29.8; 5122800,30.3; 5126400,33.1;
        5130000,33; 5133600,33.3; 5137200,33.7; 5140800,33.9; 5144400,34.1;
        5148000,34.2; 5151600,34.3; 5155200,34.9; 5158800,34.8; 5162400,33;
        5166000,32.7; 5169600,32.2; 5173200,31.8; 5176800,31.4; 5180400,31.2;
        5184000,30.9])
    annotation (Placement(transformation(extent={{76,72},{96,92}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow machinesConv
    annotation (Placement(transformation(extent={{48,-66},{68,-46}})));

  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor indoorTemp
    annotation (Placement(transformation(extent={{96,-20},{88,-12}})));
  Modelica.Blocks.Sources.Constant alphaWall(k=25*10.5)
    "Outdoor coefficient of heat transfer for walls" annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={30,-18})));
  Modelica.Blocks.Sources.CombiTimeTable outdoorTemp(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    columns={2},
    table=[0,291.95; 3600,291.95; 3600,290.25; 7200,290.25; 7200,289.65; 10800,
        289.65; 10800,289.25; 14400,289.25; 14400,289.65; 18000,289.65; 18000,
        290.95; 21600,290.95; 21600,293.45; 25200,293.45; 25200,295.95; 28800,
        295.95; 28800,297.95; 32400,297.95; 32400,299.85; 36000,299.85; 36000,
        301.25; 39600,301.25; 39600,302.15; 43200,302.15; 43200,302.85; 46800,
        302.85; 46800,303.55; 50400,303.55; 50400,304.05; 54000,304.05; 54000,
        304.15; 57600,304.15; 57600,303.95; 61200,303.95; 61200,303.25; 64800,
        303.25; 64800,302.05; 68400,302.05; 68400,300.15; 72000,300.15; 72000,
        297.85; 75600,297.85; 75600,296.05; 79200,296.05; 79200,295.05; 82800,
        295.05; 82800,294.05; 86400,294.05])
    annotation (Placement(transformation(extent={{-28,-8},{-12,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow personsRad
    annotation (Placement(transformation(extent={{48,-102},{68,-82}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow personsConv
    annotation (Placement(transformation(extent={{48,-84},{68,-64}})));
  Modelica.Blocks.Sources.CombiTimeTable tableSolRadWindow(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableOnFile=false,
    table=[0,0; 3600,0; 10800,0; 14400,0; 14400,17; 18000,17; 18000,38; 21600,
        38; 21600,59; 25200,59; 25200,98; 28800,98; 28800,186; 32400,186; 32400,
        287; 36000,287; 36000,359; 39600,359; 39600,385; 43200,385; 43200,359;
        46800,359; 46800,287; 50400,287; 50400,186; 54000,186; 54000,98; 57600,
        98; 57600,59; 61200,59; 61200,38; 64800,38; 64800,17; 68400,17; 68400,0;
        72000,0; 82800,0; 86400,0],
    columns={2})
    annotation (Placement(transformation(extent={{-84,66},{-70,80}})));
  Modelica.Blocks.Sources.Constant g_sunblind(k=0.15) annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=-90,
        origin={-19,57})));
  Modelica.Blocks.Sources.Constant sunblind_open(k=1) annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=-90,
        origin={-33,57})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=100)
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-59,59})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-6,65},{4,75}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-26,38})));
  Modelica.Blocks.Sources.CombiTimeTable ventRate(
    tableOnFile=false,
    columns={2},
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    table=[0,100; 3600,100; 7200,100; 10800,100; 14400,100; 18000,100; 21600,
        100; 25200,100; 25200,50; 28800,50; 32400,50; 36000,50; 39600,50; 43200,
        50; 46800,50; 50400,50; 54000,50; 57600,50; 61200,50; 61200,100; 64800,
        100; 72000,100; 75600,100; 79200,100; 82800,100; 86400,100])
    annotation (Placement(transformation(extent={{-86,-29},{-72,-15}})));
  Modelica.Blocks.Math.Gain gain(k=0.000330375898)
    annotation (Placement(transformation(extent={{-62,-29},{-48,-15}})));
  Fluid.Sources.MassFlowSource_T ventilationIn(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1)
    annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
  Fluid.Sources.MassFlowSource_T ventilationOut(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    nPorts=1,
    use_T_in=false)
    annotation (Placement(transformation(extent={{-32,-72},{-12,-52}})));
  Modelica.Blocks.Math.Gain gain1(k=-1)
    annotation (Placement(transformation(extent={{-62,-61},{-48,-47}})));
equation
  connect(indoorTemp.port, thermalZoneTwoElements.intGainsConv)
    annotation (Line(points={{96,-16},{96,19.8},{91,19.8}}, color={191,0,0}));
  connect(machinesConv.port, indoorTemp.port)
    annotation (Line(points={{68,-56},{96,-56},{96,-16}}, color={191,0,0}));
  connect(thermalConductorWall.fluid, prescribedTemperature.port)
    annotation (Line(points={{26,1},{24,1},{24,0},{20,0}}, color={191,0,0}));
  connect(thermalZoneTwoElements.extWall, thermalConductorWall.solid)
    annotation (Line(points={{45,12.4},{40,12.4},{40,1},{36,1}}, color={191,0,0}));
  connect(alphaWall.y, thermalConductorWall.Gc)
    annotation (Line(points={{30,-13.6},{31,-13.6},{31,-4}}, color={0,0,127}));
  connect(outdoorTemp.y[1], prescribedTemperature.T)
    annotation (Line(points={{-11.2,0},{6.8,0}}, color={0,0,127}));
  connect(personsRad.port, thermalZoneTwoElements.intGainsRad) annotation (Line(
        points={{68,-92},{68,-92},{98,-92},{98,26},{91,26}}, color={191,0,0}));
  connect(personsConv.port, indoorTemp.port)
    annotation (Line(points={{68,-74},{96,-74},{96,-16}}, color={191,0,0}));
  connect(internalGains.y[1], personsRad.Q_flow) annotation (Line(points={{22.8,
          -52},{30,-52},{38,-52},{38,-92},{48,-92}}, color={0,0,127}));
  connect(internalGains.y[2], personsConv.Q_flow) annotation (Line(points={{
          22.8,-52},{38,-52},{38,-74},{48,-74}}, color={0,0,127}));
  connect(internalGains.y[3], machinesConv.Q_flow) annotation (Line(points={{
          22.8,-52},{38,-52},{38,-56},{48,-56}}, color={0,0,127}));
  connect(tableSolRadWindow.y[1],greaterThreshold1. u)
    annotation (Line(points={{-69.3,73},{-59,73},{-59,65}}, color={0,0,127}));
  connect(sunblind_open.y, switch1.u3) annotation (Line(points={{-33,53.7},{-33,
          48},{-30.8,48},{-30.8,45.2}}, color={0,0,127}));
  connect(g_sunblind.y, switch1.u1) annotation (Line(points={{-19,53.7},{-19,48},
          {-21.2,48},{-21.2,45.2}}, color={0,0,127}));
  connect(tableSolRadWindow.y[1], product1.u1) annotation (Line(points={{-69.3,
          73},{-37.65,73},{-7,73}}, color={0,0,127}));
  connect(greaterThreshold1.y, switch1.u2) annotation (Line(points={{-59,53.5},
          {-59,46},{-40,46},{-40,64},{-26,64},{-26,45.2}}, color={255,0,255}));
  connect(switch1.y, product1.u2) annotation (Line(points={{-26,31.4},{-26,28},
          {-10,28},{-10,67},{-7,67}}, color={0,0,127}));
  connect(product1.y, thermalZoneTwoElements.solRad) annotation (Line(points={{
          4.5,70},{20,70},{20,30.8},{45,30.8}}, color={0,0,127}));
  connect(ventRate.y[1], gain.u) annotation (Line(points={{-71.3,-22},{-68,-22},
          {-63.4,-22}}, color={0,0,127}));
  connect(ventilationIn.ports[1], thermalZoneTwoElements.ports[1]) annotation (
      Line(points={{-10,-30},{-10,-30},{82,-30},{82,-1.15},{81.475,-1.15}},
        color={0,127,255}));
  connect(gain.y, ventilationIn.m_flow_in)
    annotation (Line(points={{-47.3,-22},{-30,-22}}, color={0,0,127}));
  connect(outdoorTemp.y[1], ventilationIn.T_in) annotation (Line(points={{-11.2,
          0},{-4,0},{-4,-12},{-42,-12},{-42,-26},{-32,-26}}, color={0,0,127}));
  connect(gain.y, gain1.u) annotation (Line(points={{-47.3,-22},{-44,-22},{-44,
          -38},{-70,-38},{-70,-54},{-63.4,-54}}, color={0,0,127}));
  connect(gain1.y, ventilationOut.m_flow_in)
    annotation (Line(points={{-47.3,-54},{-32,-54}}, color={0,0,127}));
  connect(ventilationOut.ports[1], thermalZoneTwoElements.ports[2]) annotation (
     Line(points={{-12,-62},{-6,-62},{0,-62},{0,-36},{84.525,-36},{84.525,-1.15}},
        color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
<p>For this example, the following boundary conditions are taken from Guideline VDI 6007:</p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">Dry bulb temperature</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Infrared horizontal radiation</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Global normal radiation</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Diffuse normal radiation</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Internal radiative gains from persons</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Internal convective gains from persons</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Internal convective gains from machines</span></li>
</ul>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">The guideline is also the source of the building physics, orientations, areas, set temperatures and reference values. As global and diffuse radiation are given in the guideline normal to the facades and are here used as normal to the sun, this example cannot be taken for validation. In addition, the calculation core is not configured to be exactly the VDI 6007 core. In this example, the windows are not merged with the exterior walls. The reference values are taken from test case 8. This case doesn&apos;t consider outdoor longwave radiation exchange but this example does. Furthermore, the test case considers sunblinds (closing at 100 w/m2) what is not included in this example. It&apos;s just to show a typical application.</span></p>
</html>"),
    experiment(
      StopTime=5.184e+006,
      Interval=3600,
      __Dymola_Algorithm="Lsodar"));
end TestCase12;