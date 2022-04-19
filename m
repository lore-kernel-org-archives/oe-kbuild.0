Content-Type: multipart/mixed; boundary="===============1241634196521180704=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 6/8] test_firmware: Add test support for firmware upload
Date: Tue, 19 Apr 2022 19:50:41 +0800
Message-ID: <202204191900.1DwwOU9L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1241634196521180704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220418223753.639058-7-russell.h.weight@intel.com>
References: <20220418223753.639058-7-russell.h.weight@intel.com>
TO: Russ Weight <russell.h.weight@intel.com>
TO: mcgrof(a)kernel.org
TO: rafael(a)kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: trix(a)redhat.com
CC: lgoncalv(a)redhat.com
CC: yilun.xu(a)intel.com
CC: hao.wu(a)intel.com
CC: matthew.gerlach(a)linux.intel.com
CC: basheer.ahmed.muddebihal(a)intel.com
CC: tianfei.zhang(a)intel.com
CC: Russ Weight <russell.h.weight@intel.com>

Hi Russ,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on shuah-kselftest/next mcgrof/sysctl-next linus/m=
aster v5.18-rc3 next-20220419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Russ-Weight/Extend-F=
W-framework-for-user-FW-uploads/20220419-064126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git 3123109284176b1532874591f7c81f3837bbdc17
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: powerpc64-randconfig-c003-20220418 (https://download.01.org/0day-ci=
/archive/20220419/202204191900.1DwwOU9L-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> lib/test_firmware.c:1291:5-8: ERROR: invalid reference to the index vari=
able of the iterator on line 1287

vim +1291 lib/test_firmware.c

c92316bf8e94830a Luis R. Rodriguez 2017-07-20  1273  =

cb4d12e8d7596410 Russ Weight       2022-04-18  1274  static ssize_t upload_=
read_show(struct device *dev,
cb4d12e8d7596410 Russ Weight       2022-04-18  1275  				struct device_attr=
ibute *attr,
cb4d12e8d7596410 Russ Weight       2022-04-18  1276  				char *buf)
cb4d12e8d7596410 Russ Weight       2022-04-18  1277  {
cb4d12e8d7596410 Russ Weight       2022-04-18  1278  	struct test_firmware_=
upload *tst;
cb4d12e8d7596410 Russ Weight       2022-04-18  1279  	int ret =3D -EINVAL;
cb4d12e8d7596410 Russ Weight       2022-04-18  1280  =

cb4d12e8d7596410 Russ Weight       2022-04-18  1281  	if (!test_fw_config->=
upload_name) {
cb4d12e8d7596410 Russ Weight       2022-04-18  1282  		pr_err("Set config_u=
pload_name before using upload_read\n");
cb4d12e8d7596410 Russ Weight       2022-04-18  1283  		return -EINVAL;
cb4d12e8d7596410 Russ Weight       2022-04-18  1284  	}
cb4d12e8d7596410 Russ Weight       2022-04-18  1285  =

cb4d12e8d7596410 Russ Weight       2022-04-18  1286  	mutex_lock(&test_fw_m=
utex);
cb4d12e8d7596410 Russ Weight       2022-04-18 @1287  	list_for_each_entry(t=
st, &test_upload_list, node)
cb4d12e8d7596410 Russ Weight       2022-04-18  1288  		if (tst->name =3D=3D=
 test_fw_config->upload_name)
cb4d12e8d7596410 Russ Weight       2022-04-18  1289  			break;
cb4d12e8d7596410 Russ Weight       2022-04-18  1290  =

cb4d12e8d7596410 Russ Weight       2022-04-18 @1291  	if (tst->name !=3D te=
st_fw_config->upload_name) {
cb4d12e8d7596410 Russ Weight       2022-04-18  1292  		pr_err("Firmware nam=
e not found: %s\n",
cb4d12e8d7596410 Russ Weight       2022-04-18  1293  		       test_fw_confi=
g->upload_name);
cb4d12e8d7596410 Russ Weight       2022-04-18  1294  		goto out;
cb4d12e8d7596410 Russ Weight       2022-04-18  1295  	}
cb4d12e8d7596410 Russ Weight       2022-04-18  1296  =

cb4d12e8d7596410 Russ Weight       2022-04-18  1297  	if (tst->size > PAGE_=
SIZE) {
cb4d12e8d7596410 Russ Weight       2022-04-18  1298  		pr_err("Testing inte=
rface must use PAGE_SIZE firmware for now\n");
cb4d12e8d7596410 Russ Weight       2022-04-18  1299  		goto out;
cb4d12e8d7596410 Russ Weight       2022-04-18  1300  	}
cb4d12e8d7596410 Russ Weight       2022-04-18  1301  =

cb4d12e8d7596410 Russ Weight       2022-04-18  1302  	memcpy(buf, tst->buf,=
 tst->size);
cb4d12e8d7596410 Russ Weight       2022-04-18  1303  	ret =3D tst->size;
cb4d12e8d7596410 Russ Weight       2022-04-18  1304  out:
cb4d12e8d7596410 Russ Weight       2022-04-18  1305  	mutex_unlock(&test_fw=
_mutex);
cb4d12e8d7596410 Russ Weight       2022-04-18  1306  	return ret;
cb4d12e8d7596410 Russ Weight       2022-04-18  1307  }
cb4d12e8d7596410 Russ Weight       2022-04-18  1308  static DEVICE_ATTR_RO(=
upload_read);
cb4d12e8d7596410 Russ Weight       2022-04-18  1309  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1241634196521180704==--

