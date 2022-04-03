Content-Type: multipart/mixed; boundary="===============6579680704839397281=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/hw_random/atmel-rng.c:193:2: warning: There is an unknown macro here somewhere. Configuration is required. If SET_RUNTIME_PM_OPS is a macro then please configure it. [unknownMacro]
Date: Mon, 04 Apr 2022 00:09:57 +0800
Message-ID: <202204040042.U9oV6hy6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6579680704839397281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: c4f51eab6ce0b7138f375673dbb2789e49b6d028 hwrng: atmel - add runtime=
 pm support
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> security/keys/dh.c:269:24: warning: syntax error: ~ . completion [syntax=
Error]
    init_completion(&compl.completion);
                          ^
--
>> drivers/char/hw_random/atmel-rng.c:193:2: warning: There is an unknown m=
acro here somewhere. Configuration is required. If SET_RUNTIME_PM_OPS is a =
macro then please configure it. [unknownMacro]
    SET_RUNTIME_PM_OPS(atmel_trng_runtime_suspend,
    ^
--
>> lib/crc32.c:78:16: warning: Null pointer dereference: tab [ctunullpointe=
r]
    const u32 *t0=3Dtab[0], *t1=3Dtab[1], *t2=3Dtab[2], *t3=3Dtab[3];
                  ^
   lib/crc32.c:188:25: note: Calling function crc32_le_generic, 4th argumen=
t is null
    return crc32_le_generic(crc, p, len, NULL, CRC32_POLY_LE);
                           ^
   lib/crc32.c:179:8: note: Calling function crc32_body, 4th argument is nu=
ll
    crc =3D crc32_body(crc, p, len, tab);
          ^
   lib/crc32.c:78:16: note: Dereferencing argument tab that is null
    const u32 *t0=3Dtab[0], *t1=3Dtab[1], *t2=3Dtab[2], *t3=3Dtab[3];
                  ^

vim +193 drivers/char/hw_random/atmel-rng.c

677d3e2f07d1b3 Peter Korsgaard 2011-10-06  191  =

b9531885259733 Claudiu Beznea  2022-02-21  192  static const struct dev_pm_=
ops __maybe_unused atmel_trng_pm_ops =3D {
c4f51eab6ce0b7 Claudiu Beznea  2022-02-21 @193  	SET_RUNTIME_PM_OPS(atmel_t=
rng_runtime_suspend,
c4f51eab6ce0b7 Claudiu Beznea  2022-02-21  194  			   atmel_trng_runtime_re=
sume, NULL)
c4f51eab6ce0b7 Claudiu Beznea  2022-02-21  195  	SET_SYSTEM_SLEEP_PM_OPS(pm=
_runtime_force_suspend,
c4f51eab6ce0b7 Claudiu Beznea  2022-02-21  196  				pm_runtime_force_resume)
677d3e2f07d1b3 Peter Korsgaard 2011-10-06  197  };
677d3e2f07d1b3 Peter Korsgaard 2011-10-06  198  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6579680704839397281==--

