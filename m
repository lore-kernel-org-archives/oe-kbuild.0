Content-Type: multipart/mixed; boundary="===============0297525317612326392=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 426/12343] drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:46 sysfs_gt_attribute_w_func() error: uninitialized symbol 'ret'.
Date: Wed, 18 May 2022 06:29:44 +0800
Message-ID: <202205180649.2GCfwsqR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0297525317612326392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andi Shyti <andi.shyti@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   47c1c54d1bcd0a69a56b49473bc20f17b70e5242
commit: 56a709cf77468e3a422b0ce3d58f8c2257bac2f1 [426/12343] drm/i915/gt: C=
reate per-tile RPS sysfs interfaces
:::::: branch date: 13 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-m001-20220516 (https://download.01.org/0day-ci/ar=
chive/20220518/202205180649.2GCfwsqR-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:46 sysfs_gt_attribute_w_func() =
error: uninitialized symbol 'ret'.

vim +/ret +46 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c

80cf8af17af042 Andi Shyti 2022-03-19  24  =

56a709cf77468e Andi Shyti 2022-03-19  25  static int
56a709cf77468e Andi Shyti 2022-03-19  26  sysfs_gt_attribute_w_func(struct =
device *dev, struct device_attribute *attr,
56a709cf77468e Andi Shyti 2022-03-19  27  			  int (func)(struct intel_gt *=
gt, u32 val), u32 val)
56a709cf77468e Andi Shyti 2022-03-19  28  {
56a709cf77468e Andi Shyti 2022-03-19  29  	struct intel_gt *gt;
56a709cf77468e Andi Shyti 2022-03-19  30  	int ret;
56a709cf77468e Andi Shyti 2022-03-19  31  =

56a709cf77468e Andi Shyti 2022-03-19  32  	if (!is_object_gt(&dev->kobj)) {
56a709cf77468e Andi Shyti 2022-03-19  33  		int i;
56a709cf77468e Andi Shyti 2022-03-19  34  		struct drm_i915_private *i915 =
=3D kdev_minor_to_i915(dev);
56a709cf77468e Andi Shyti 2022-03-19  35  =

56a709cf77468e Andi Shyti 2022-03-19  36  		for_each_gt(gt, i915, i) {
56a709cf77468e Andi Shyti 2022-03-19  37  			ret =3D func(gt, val);
56a709cf77468e Andi Shyti 2022-03-19  38  			if (ret)
56a709cf77468e Andi Shyti 2022-03-19  39  				break;
56a709cf77468e Andi Shyti 2022-03-19  40  		}
56a709cf77468e Andi Shyti 2022-03-19  41  	} else {
56a709cf77468e Andi Shyti 2022-03-19  42  		gt =3D intel_gt_sysfs_get_drvda=
ta(dev, attr->attr.name);
56a709cf77468e Andi Shyti 2022-03-19  43  		ret =3D func(gt, val);
56a709cf77468e Andi Shyti 2022-03-19  44  	}
56a709cf77468e Andi Shyti 2022-03-19  45  =

56a709cf77468e Andi Shyti 2022-03-19 @46  	return ret;
56a709cf77468e Andi Shyti 2022-03-19  47  }
56a709cf77468e Andi Shyti 2022-03-19  48  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0297525317612326392==--

