// See README.md for license details.

ThisBuild / scalaVersion     := "2.12.17"
ThisBuild / version          := "0.1.0"
ThisBuild / organization     := "com.github.tkgdsg"

Test / testOptions += Tests.Argument("-DwriteVcd=1")
Test / fork := true

lazy val osName = System.getProperty("os.name") match {
  case n if n.startsWith("Linux") => "linux"
  case n if n.startsWith("Mac") => "mac"
  case n if n.startsWith("Windows") => "win"
  case _ => throw new Exception("Unknown platform!")
}

// Add JavaFX dependencies
lazy val javaFXModules = Seq("base", "controls", "fxml", "graphics", "media", "swing", "web")
libraryDependencies ++= javaFXModules.map( m=>
  "org.openjfx" % s"javafx-$m" % "11" classifier osName
)

lazy val root = (project in file("."))
  .settings(
    name := "z80",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % "3.5.+",
      "edu.berkeley.cs" %% "chiseltest" % "0.5.6", // % "test",
      "org.scalatest" %% "scalatest" % "3.2.15", // % "test",
//      "edu.berkeley.cs" %% "chisel-iotesters" % "1.5.+",
//      "org.scalafx" %% "scalafx" % "10.0.2-R15"
      "org.scalafx" %% "scalafx" % "10.0.2-R15",
    ),
    scalacOptions ++= Seq(
      "-Xsource:2.11",
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",
      "-unchecked",
//      "-deperecation"
    ),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.+" cross CrossVersion.full),
    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full),
    fork := true
  )
