Content-Type: multipart/mixed; boundary="===============2330275921281658510=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chanwoo:devfreq-testing-timer 5/5] drivers/devfreq/tegra30-devfreq.c:770:0: warning: syntax error
Date: Mon, 06 Jul 2020 06:13:09 +0800
Message-ID: <202007060605.kNPUDrb4%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2330275921281658510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Chanwoo Choi <cw00.choi@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing-timer
head:   20dcdf2e2493025a08aec1d2b11f0148b4810adb
commit: 20dcdf2e2493025a08aec1d2b11f0148b4810adb [5/5] PM / devfreq: Add go=
vernor flags to clarify the features
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/devfreq/tegra30-devfreq.c:770:0: warning: syntax error [syntaxEr=
ror]
   =

   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/=
?id=3D20dcdf2e2493025a08aec1d2b11f0148b4810adb
git remote add chanwoo https://git.kernel.org/pub/scm/linux/kernel/git/chan=
woo/linux.git
git remote update chanwoo
git checkout 20dcdf2e2493025a08aec1d2b11f0148b4810adb
vim +770 drivers/devfreq/tegra30-devfreq.c

6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2014-11-24  7=
65  =

6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2014-11-24  7=
66  static struct devfreq_governor tegra_devfreq_governor =3D {
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2015-03-17  7=
67  	.name =3D "tegra_actmon",
20dcdf2e249302 drivers/devfreq/tegra30-devfreq.c Chanwoo Choi 2020-07-03  7=
68  	.flag =3D DEVFREQ_GOV_FLAG_ATTR_COMMON
20dcdf2e249302 drivers/devfreq/tegra30-devfreq.c Chanwoo Choi 2020-07-03  7=
69  		| DEVFREQ_GOV_FLAG_ATTR_POLLING_INTERVAL,
20dcdf2e249302 drivers/devfreq/tegra30-devfreq.c Chanwoo Choi 2020-07-03 @7=
70  	.flag =3D DEVFREQ_GOV_FLAG_FLAG_IMMUTABLE,
20dcdf2e249302 drivers/devfreq/tegra30-devfreq.c Chanwoo Choi 2020-07-03  7=
71  		| DEVFREQ_GOV_FLAG_FLAG_IRQ_DRIVEN,
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2015-03-17  7=
72  	.get_target_freq =3D tegra_governor_get_target,
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2015-03-17  7=
73  	.event_handler =3D tegra_governor_event_handler,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2014-11-24  7=
74  };
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso 2014-11-24  7=
75  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2330275921281658510==--

