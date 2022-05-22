Content-Type: multipart/mixed; boundary="===============1209020400774806777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rafael-pm:bleeding-edge 191/248] kernel/reboot.c:517:43: warning: Parameter 'power_off' can be declared with const [constParameter]
Date: Sun, 22 May 2022 20:40:22 +0800
Message-ID: <202205222015.sb44KHH8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1209020400774806777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-acpi(a)vger.kernel.org
CC: devel(a)acpica.org
CC: linux-pm(a)vger.kernel.org
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 bleeding-edge
head:   3d22e39d225d7adb6c670065f4ae016e759171ed
commit: fb61375ecfba49e153af561402f49f6fe3bebd39 [191/248] kernel/reboot: A=
dd register_platform_power_off()
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fb61375ecfba49e153af561402f49f6fe3bebd39
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/reboot.c:517:43: warning: Parameter 'power_off' can be declared w=
ith const [constParameter]
   void unregister_platform_power_off(void (*power_off)(void))
                                             ^

vim +/power_off +517 kernel/reboot.c

fb61375ecfba49 Dmitry Osipenko 2022-05-10  510  =

fb61375ecfba49 Dmitry Osipenko 2022-05-10  511  /**
fb61375ecfba49 Dmitry Osipenko 2022-05-10  512   *	unregister_platform_powe=
r_off - Unregister platform-level power-off callback
fb61375ecfba49 Dmitry Osipenko 2022-05-10  513   *	@power_off: Power-off ca=
llback
fb61375ecfba49 Dmitry Osipenko 2022-05-10  514   *
fb61375ecfba49 Dmitry Osipenko 2022-05-10  515   *	Unregisters previously r=
egistered platform power-off callback.
fb61375ecfba49 Dmitry Osipenko 2022-05-10  516   */
fb61375ecfba49 Dmitry Osipenko 2022-05-10 @517  void unregister_platform_po=
wer_off(void (*power_off)(void))
fb61375ecfba49 Dmitry Osipenko 2022-05-10  518  {
fb61375ecfba49 Dmitry Osipenko 2022-05-10  519  	if (platform_power_off_han=
dler &&
fb61375ecfba49 Dmitry Osipenko 2022-05-10  520  	    platform_power_off_han=
dler->cb_data =3D=3D power_off) {
fb61375ecfba49 Dmitry Osipenko 2022-05-10  521  		unregister_sys_off_handle=
r(platform_power_off_handler);
fb61375ecfba49 Dmitry Osipenko 2022-05-10  522  		platform_power_off_handle=
r =3D NULL;
fb61375ecfba49 Dmitry Osipenko 2022-05-10  523  	}
fb61375ecfba49 Dmitry Osipenko 2022-05-10  524  }
fb61375ecfba49 Dmitry Osipenko 2022-05-10  525  EXPORT_SYMBOL_GPL(unregiste=
r_platform_power_off);
fb61375ecfba49 Dmitry Osipenko 2022-05-10  526  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1209020400774806777==--

