Content-Type: multipart/mixed; boundary="===============8297326386620661673=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/kspp 5/11] drivers/md/dm-verity-loadpin.c:16:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 02 Aug 2022 09:55:12 +0800
Message-ID: <202208020921.p8oEY4uF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8297326386620661673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
d/dm-verity-loadpin.c:16:13: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Matthias Kaehlcke <mka@chromium.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/kspp
head:   27603a606fda0806d7c08914bc976931aa42020e
commit: b6c1c5745ccc68ac5d57c7ffb51ea25a86d0e97b [5/11] dm: Add verity help=
ers for LoadPin
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208020921.p8oEY4uF-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3Db6c1c5745ccc68ac5d57c7ffb51ea25a86d0e97b
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git
        git fetch --no-tags kees for-next/kspp
        git checkout b6c1c5745ccc68ac5d57c7ffb51ea25a86d0e97b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/md/dm-verity-loadpin.c: In function 'is_trusted_verity_target':
>> drivers/md/dm-verity-loadpin.c:16:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      16 |         u8 *root_digest;
         |             ^~~~~~~~~~~
     'is_trusted_verity_target': event 1
       |
       |   16 |         u8 *root_digest;
       |      |             ^~~~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/md/dm-verity-loadpin.c:17:22: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      17 |         unsigned int digest_size;
         |                      ^~~~~~~~~~~
     'is_trusted_verity_target': event 1
       |
       |   17 |         unsigned int digest_size;
       |      |                      ^~~~~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/md/dm-verity-loadpin.c: In function 'dm_verity_loadpin_is_bdev_t=
rusted':
   drivers/md/dm-verity-loadpin.c:49:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      49 |         int srcu_idx;
         |             ^~~~~~~~
     'dm_verity_loadpin_is_bdev_trusted': event 1
       |
       |   49 |         int srcu_idx;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +16 drivers/md/dm-verity-loadpin.c

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  13  =

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  14  static bool is_trusted_ver=
ity_target(struct dm_target *ti)
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  15  {
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27 @16  	u8 *root_digest;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  17  	unsigned int digest_size;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  18  	struct dm_verity_loadpin_=
trusted_root_digest *trd;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  19  	bool trusted =3D false;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  20  =

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  21  	if (!dm_is_verity_target(=
ti))
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  22  		return false;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  23  =

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  24  	if (dm_verity_get_root_di=
gest(ti, &root_digest, &digest_size))
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  25  		return false;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  26  =

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  27  	list_for_each_entry(trd, =
&dm_verity_loadpin_trusted_root_digests, node) {
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  28  		if ((trd->len =3D=3D dig=
est_size) &&
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  29  		    !memcmp(trd->data, r=
oot_digest, digest_size)) {
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  30  			trusted =3D true;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  31  			break;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  32  		}
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  33  	}
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  34  =

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  35  	kfree(root_digest);
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  36  =

b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  37  	return trusted;
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  38  }
b6c1c5745ccc68 Matthias Kaehlcke 2022-06-27  39  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8297326386620661673==--

