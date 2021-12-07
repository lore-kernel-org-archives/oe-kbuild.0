Content-Type: multipart/mixed; boundary="===============1998845135540609648=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xiang-erofs:dev-test 2/4] fs/erofs/sysfs.c:131 erofs_attr_store() warn: impossible condition '(t > (~0)) => (0-u32max > u32max)'
Date: Tue, 07 Dec 2021 09:01:51 +0800
Message-ID: <202112070831.UyKX6QDb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1998845135540609648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Xiang Gao <xiang@kernel.org>
CC: linux-erofs(a)lists.ozlabs.org
TO: Huang Jianan <huangjianan@oppo.com>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev=
-test
head:   ac913fada7e1bba6d1aa9fbb707c8cc4529af9b8
commit: 8645bf5f00b6aa29d35707765a46fe8cdd89e0ee [2/4] erofs: add sysfs int=
erface
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211207/202112070831.UyKX6QDb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/erofs/sysfs.c:131 erofs_attr_store() warn: impossible condition '(t > (~=
0)) =3D> (0-u32max > u32max)'

vim +131 fs/erofs/sysfs.c

8645bf5f00b6aa Huang Jianan 2021-12-01  113  =

8645bf5f00b6aa Huang Jianan 2021-12-01  114  static ssize_t erofs_attr_stor=
e(struct kobject *kobj, struct attribute *attr,
8645bf5f00b6aa Huang Jianan 2021-12-01  115  						const char *buf, size_t =
len)
8645bf5f00b6aa Huang Jianan 2021-12-01  116  {
8645bf5f00b6aa Huang Jianan 2021-12-01  117  	struct erofs_sb_info *sbi =3D=
 container_of(kobj, struct erofs_sb_info,
8645bf5f00b6aa Huang Jianan 2021-12-01  118  						s_kobj);
8645bf5f00b6aa Huang Jianan 2021-12-01  119  	struct erofs_attr *a =3D cont=
ainer_of(attr, struct erofs_attr, attr);
8645bf5f00b6aa Huang Jianan 2021-12-01  120  	unsigned char *ptr =3D __stru=
ct_ptr(sbi, a->struct_type, a->offset);
8645bf5f00b6aa Huang Jianan 2021-12-01  121  	unsigned long t;
8645bf5f00b6aa Huang Jianan 2021-12-01  122  	int ret;
8645bf5f00b6aa Huang Jianan 2021-12-01  123  =

8645bf5f00b6aa Huang Jianan 2021-12-01  124  	switch (a->attr_id) {
8645bf5f00b6aa Huang Jianan 2021-12-01  125  	case attr_pointer_ui:
8645bf5f00b6aa Huang Jianan 2021-12-01  126  		if (!ptr)
8645bf5f00b6aa Huang Jianan 2021-12-01  127  			return 0;
8645bf5f00b6aa Huang Jianan 2021-12-01  128  		ret =3D kstrtoul(skip_spaces=
(buf), 0, &t);
8645bf5f00b6aa Huang Jianan 2021-12-01  129  		if (ret)
8645bf5f00b6aa Huang Jianan 2021-12-01  130  			return ret;
8645bf5f00b6aa Huang Jianan 2021-12-01 @131  		if (t > UINT_MAX)
8645bf5f00b6aa Huang Jianan 2021-12-01  132  			return -EINVAL;
8645bf5f00b6aa Huang Jianan 2021-12-01  133  		*(unsigned int *)ptr =3D t;
8645bf5f00b6aa Huang Jianan 2021-12-01  134  		return len;
8645bf5f00b6aa Huang Jianan 2021-12-01  135  	case attr_pointer_bool:
8645bf5f00b6aa Huang Jianan 2021-12-01  136  		if (!ptr)
8645bf5f00b6aa Huang Jianan 2021-12-01  137  			return 0;
8645bf5f00b6aa Huang Jianan 2021-12-01  138  		ret =3D kstrtoul(skip_spaces=
(buf), 0, &t);
8645bf5f00b6aa Huang Jianan 2021-12-01  139  		if (ret)
8645bf5f00b6aa Huang Jianan 2021-12-01  140  			return ret;
8645bf5f00b6aa Huang Jianan 2021-12-01  141  		if (t !=3D 0 && t !=3D 1)
8645bf5f00b6aa Huang Jianan 2021-12-01  142  			return -EINVAL;
8645bf5f00b6aa Huang Jianan 2021-12-01  143  		*(bool *)ptr =3D !!t;
8645bf5f00b6aa Huang Jianan 2021-12-01  144  		return len;
8645bf5f00b6aa Huang Jianan 2021-12-01  145  	}
8645bf5f00b6aa Huang Jianan 2021-12-01  146  	return 0;
8645bf5f00b6aa Huang Jianan 2021-12-01  147  }
8645bf5f00b6aa Huang Jianan 2021-12-01  148  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1998845135540609648==--

