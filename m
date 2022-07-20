Content-Type: multipart/mixed; boundary="===============5877932386743187051=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/hw_random/core.c:429:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 20 Jul 2022 21:34:25 +0800
Message-ID: <202207202141.uHkem5CH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5877932386743187051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/c=
har/hw_random/core.c:429:13: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dominik Brodowski <linux@dominikbrodowski.net>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: 8208285632f950d2bfd489b10148e05134b7119e hwrng: core - introduce rn=
g_quality sysfs attribute
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220720/202207202141.uHkem5CH-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8208285632f950d2bfd489b10148e05134b7119e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8208285632f950d2bfd489b10148e05134b7119e
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/char/hw_random/core.c: In function 'rng_quality_store':
>> drivers/char/hw_random/core.c:429:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     429 |         u16 quality;
         |             ^~~~~~~
     'rng_quality_store': event 1
       |
       |  429 |         u16 quality;
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +429 drivers/char/hw_random/core.c

8208285632f950 Dominik Brodowski 2022-02-13  424  =

8208285632f950 Dominik Brodowski 2022-02-13  425  static ssize_t rng_qualit=
y_store(struct device *dev,
8208285632f950 Dominik Brodowski 2022-02-13  426  				 struct device_attrib=
ute *attr,
8208285632f950 Dominik Brodowski 2022-02-13  427  				 const char *buf, siz=
e_t len)
8208285632f950 Dominik Brodowski 2022-02-13  428  {
8208285632f950 Dominik Brodowski 2022-02-13 @429  	u16 quality;
8208285632f950 Dominik Brodowski 2022-02-13  430  	int ret =3D -EINVAL;
8208285632f950 Dominik Brodowski 2022-02-13  431  =

8208285632f950 Dominik Brodowski 2022-02-13  432  	if (len < 2)
8208285632f950 Dominik Brodowski 2022-02-13  433  		return -EINVAL;
8208285632f950 Dominik Brodowski 2022-02-13  434  =

8208285632f950 Dominik Brodowski 2022-02-13  435  	ret =3D mutex_lock_inter=
ruptible(&rng_mutex);
8208285632f950 Dominik Brodowski 2022-02-13  436  	if (ret)
8208285632f950 Dominik Brodowski 2022-02-13  437  		return -ERESTARTSYS;
8208285632f950 Dominik Brodowski 2022-02-13  438  =

8208285632f950 Dominik Brodowski 2022-02-13  439  	ret =3D kstrtou16(buf, 0=
, &quality);
8208285632f950 Dominik Brodowski 2022-02-13  440  	if (ret || quality > 102=
4) {
8208285632f950 Dominik Brodowski 2022-02-13  441  		ret =3D -EINVAL;
8208285632f950 Dominik Brodowski 2022-02-13  442  		goto out;
8208285632f950 Dominik Brodowski 2022-02-13  443  	}
8208285632f950 Dominik Brodowski 2022-02-13  444  =

8208285632f950 Dominik Brodowski 2022-02-13  445  	if (!current_rng) {
8208285632f950 Dominik Brodowski 2022-02-13  446  		ret =3D -ENODEV;
8208285632f950 Dominik Brodowski 2022-02-13  447  		goto out;
8208285632f950 Dominik Brodowski 2022-02-13  448  	}
8208285632f950 Dominik Brodowski 2022-02-13  449  =

8208285632f950 Dominik Brodowski 2022-02-13  450  	current_rng->quality =3D=
 quality;
8208285632f950 Dominik Brodowski 2022-02-13  451  	current_quality =3D qual=
ity; /* obsolete */
8208285632f950 Dominik Brodowski 2022-02-13  452  =

8208285632f950 Dominik Brodowski 2022-02-13  453  	/* the best available RN=
G may have changed */
8208285632f950 Dominik Brodowski 2022-02-13  454  	ret =3D enable_best_rng(=
);
8208285632f950 Dominik Brodowski 2022-02-13  455  =

8208285632f950 Dominik Brodowski 2022-02-13  456  	/* start/stop rngd if ne=
cessary */
8208285632f950 Dominik Brodowski 2022-02-13  457  	if (current_rng)
8208285632f950 Dominik Brodowski 2022-02-13  458  		hwrng_manage_rngd(curre=
nt_rng);
8208285632f950 Dominik Brodowski 2022-02-13  459  =

8208285632f950 Dominik Brodowski 2022-02-13  460  out:
8208285632f950 Dominik Brodowski 2022-02-13  461  	mutex_unlock(&rng_mutex);
8208285632f950 Dominik Brodowski 2022-02-13  462  	return ret ? ret : len;
8208285632f950 Dominik Brodowski 2022-02-13  463  }
8208285632f950 Dominik Brodowski 2022-02-13  464  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5877932386743187051==--

