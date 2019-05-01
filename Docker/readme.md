# Deployment segítése Dockerrel
A feladat egy Docker konténer létrehozása az projekthez, amely tartalmazza a futtató környezetet. A konténer létrehozásához, futtatásához szükséges scriptek megírása és dokumentáció elhelyezése a projektben.

## A fájlok magyarázata:
A Docker kódunk és a hozzá tartozó scriptek az alábbi oldal blogbejegyzése alapján készült: [medium.com](https://medium.com/@elye.project/intro-to-docker-building-android-app-cb7fb1b97602)


### A DockerFile:
A docker konténerünkbe mindent bele szeretnénk csomagolni ami egy Android projekt fodításához szükséges:
>Java JDK, Android SDK, Graddle


A fájl 5 részre bontható:
- Az első a már létező Java Docker Imageből bezúzza a Java JDK-t
- A második rész megadja, hogy milyen url alapján lehet letölteni az általunk kijelölt Android SDK verizót
- A harmadik rész letölti és telepíti az SDK Managert
- A negyedik egységben telepíti az Android SDK általunk megadott verzióját.
- A Gradle nem igényel külön letöltést, mert az előbb lehúzott fejlesztő környezet tartalmazza.
- Végül létrehozunk a konténeren belül egy külön Application mappát amit később a projektünk fordítására fogunk használni

### A docker_build.sh
A Docker konténer képfájlának létrehozásához használt script.
Az előző pontban tárgyalt DockerFile leírása alapján elkészíti a docker konténert.

### A compile sh
A projekt konzolról történő fordításának kiszervezése egy scriptbe.

### A docker_run.sh
A konténer futtatásához használt script. Paraméterként meg kell neki adni az előző pontban tárgyalt scriptet, amivel elérjük, hogy a Docker konténer használatával történjen a projekt fordítása.

# Probléma a fejlesztés során
Hiányolta az Android SDK-t, amikor dockerből akartuk futtatni, de ha kivettük a gradle-nek a lokális property-jei (gradle.properties) közül az 'sdk.dir=' sort, akkor működött a dockerből való buildelés.

Ennek a problámának a megoldáséban az alábbi [GitHub Issue](https://github.com/bitrise-steplib/steps-install-missing-android-tools/issues/39) segített.

