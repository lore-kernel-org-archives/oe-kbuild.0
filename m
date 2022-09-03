Content-Type: multipart/mixed; boundary="===============6064220136278608128=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/common/auth.c:301:12: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 03 Sep 2022 13:50:50 +0800
Message-ID: <202209031323.yNDah032-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6064220136278608128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
vme/common/auth.c:301:12: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Sagi Grimberg <sagi@grimberg.me>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: f50fff73d620cd6e8f48bc58d4f1c944615a3fea nvme: implement In-Band au=
thentication
date:   4 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220903/202209031323.yNDah032-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df50fff73d620cd6e8f48bc58d4f1c944615a3fea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f50fff73d620cd6e8f48bc58d4f1c944615a3fea
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/nvme/common/auth.c: In function 'nvme_auth_transform_key':
   drivers/nvme/common/auth.c:291:17: warning: use of uninitialized value '=
transformed_key' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     291 |                 kfree_sensitive(transformed_key);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'nvme_auth_transform_key': events 1-8
       |
       |  113 |         if (hmac_id > ARRAY_SIZE(hash_map))
       |      |            ~ =

       |      |            |
       |      |            (5) ...to here
       |      |            (6) following 'false' branch...
       |  114 |                 return NULL;
       |  115 |         return hash_map[hmac_id].hmac;
       |      |                ~~~~~~~~~~~~~~~~~~~~~~
       |      |                                 |
       |      |                                 (7) ...to here
       |......
       |  237 |         u8 *transformed_key;
       |      |             ^~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       |  240 |         if (!key || !key->key) {
       |      |            ~ =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  244 |         if (key->hash =3D=3D 0) {
       |      |            ~~~~~~~~~~
       |      |            |   |
       |      |            |   (3) ...to here
       |      |            (4) following 'false' branch...
       |......
       |  255 |         if (IS_ERR(key_tfm))
       |      |            ~ =

       |      |            |
       |      |            (8) following 'false' branch...
       |
     'nvme_auth_transform_key': event 9
       |
       |include/crypto/hash.h:830:19:
       |  830 |         return tfm->descsize;
       |      |                ~~~^~~~~~~~~~
       |      |                   |
       |      |                   (9) ...to here
       |
     'nvme_auth_transform_key': events 10-14
       |
       |drivers/nvme/common/auth.c:261:12:
       |  261 |         if (!shash) {
       |      |            ^
       |      |            |
       |      |            (10) following 'true' branch...
       |  262 |                 ret =3D -ENOMEM;
       |  263 |                 goto out_free_key;
       |      |                 ~~~~
       |      |                 |
       |      |                 (11) ...to here
       |......
       |  290 |         if (ret < 0) {
       |      |            ~
       |      |            |
       |      |            (12) following 'true' branch (when 'ret < 0')...
       |  291 |                 kfree_sensitive(transformed_key);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (13) ...to here
       |      |                 (14) use of uninitialized value 'transforme=
d_key' here
       |
   drivers/nvme/common/auth.c: In function 'nvme_auth_generate_key':
>> drivers/nvme/common/auth.c:301:12: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     301 |         u8 key_hash;
         |            ^~~~~~~~
     'nvme_auth_generate_key': event 1
       |
       |  301 |         u8 key_hash;
       |      |            ^~~~~~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |

vim +301 drivers/nvme/common/auth.c

f50fff73d620cd Hannes Reinecke 2022-06-27  297  =

f50fff73d620cd Hannes Reinecke 2022-06-27  298  int nvme_auth_generate_key(=
u8 *secret, struct nvme_dhchap_key **ret_key)
f50fff73d620cd Hannes Reinecke 2022-06-27  299  {
f50fff73d620cd Hannes Reinecke 2022-06-27  300  	struct nvme_dhchap_key *ke=
y;
f50fff73d620cd Hannes Reinecke 2022-06-27 @301  	u8 key_hash;
f50fff73d620cd Hannes Reinecke 2022-06-27  302  =

f50fff73d620cd Hannes Reinecke 2022-06-27  303  	if (!secret) {
f50fff73d620cd Hannes Reinecke 2022-06-27  304  		*ret_key =3D NULL;
f50fff73d620cd Hannes Reinecke 2022-06-27  305  		return 0;
f50fff73d620cd Hannes Reinecke 2022-06-27  306  	}
f50fff73d620cd Hannes Reinecke 2022-06-27  307  =

f50fff73d620cd Hannes Reinecke 2022-06-27  308  	if (sscanf(secret, "DHHC-1=
:%hhd:%*s:", &key_hash) !=3D 1)
f50fff73d620cd Hannes Reinecke 2022-06-27  309  		return -EINVAL;
f50fff73d620cd Hannes Reinecke 2022-06-27  310  =

f50fff73d620cd Hannes Reinecke 2022-06-27  311  	/* Pass in the secret with=
out the 'DHHC-1:XX:' prefix */
f50fff73d620cd Hannes Reinecke 2022-06-27  312  	key =3D nvme_auth_extract_=
key(secret + 10, key_hash);
f50fff73d620cd Hannes Reinecke 2022-06-27  313  	if (IS_ERR(key)) {
f50fff73d620cd Hannes Reinecke 2022-06-27  314  		*ret_key =3D NULL;
f50fff73d620cd Hannes Reinecke 2022-06-27  315  		return PTR_ERR(key);
f50fff73d620cd Hannes Reinecke 2022-06-27  316  	}
f50fff73d620cd Hannes Reinecke 2022-06-27  317  =

f50fff73d620cd Hannes Reinecke 2022-06-27  318  	*ret_key =3D key;
f50fff73d620cd Hannes Reinecke 2022-06-27  319  	return 0;
f50fff73d620cd Hannes Reinecke 2022-06-27  320  }
f50fff73d620cd Hannes Reinecke 2022-06-27  321  EXPORT_SYMBOL_GPL(nvme_auth=
_generate_key);
f50fff73d620cd Hannes Reinecke 2022-06-27  322  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6064220136278608128==--

