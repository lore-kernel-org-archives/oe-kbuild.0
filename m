Content-Type: multipart/mixed; boundary="===============2969143337905471966=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH next 2/3] debugfs: introduce debugfs_create_single[, _data]
Date: Tue, 03 Dec 2019 11:38:47 +0300
Message-ID: <20191203083847.GC1787@kadam>
In-Reply-To: <20191129092752.169902-3-wangkefeng.wang@huawei.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2969143337905471966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ How do I fetch 0day git branchs?
  git fetch https://github.com/0day-ci/linux/commits/Kefeng-Wang/debugfs-in=
troduce-debugfs_create_single-seq-_data/20191129-173440
  doesn't work. - dan ]

Hi Kefeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20191128]
[cannot apply to v5.4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kefeng-Wang/debugfs-introd=
uce-debugfs_create_single-seq-_data/20191129-173440
base:    d26b0e226f222c22c3b7e9d16e5b886e7c51057a


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/debugfs/file.c:1193 debugfs_create_single_data() warn: overwrite may lea=
k 'entry'

Old smatch warnings:
include/linux/compiler.h:247 __write_once_size() warn: potential memory cor=
rupting cast 8 vs 4 bytes

# https://github.com/0day-ci/linux/commit/198a4ea9768d6790a169e8b802e702c20=
8aafbd1
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 198a4ea9768d6790a169e8b802e702c208aafbd1
vim +/entry +1193 fs/debugfs/file.c

198a4ea9768d67 Kefeng Wang      2019-11-29  1179  struct dentry *debugfs_cr=
eate_single_data(const char *name, umode_t mode,
198a4ea9768d67 Kefeng Wang      2019-11-29  1180  					  struct dentry *par=
ent, void *data,
198a4ea9768d67 Kefeng Wang      2019-11-29  1181  					  int (*read_fn)(str=
uct seq_file *s,
198a4ea9768d67 Kefeng Wang      2019-11-29  1182  							 void *data))
198a4ea9768d67 Kefeng Wang      2019-11-29  1183  {
198a4ea9768d67 Kefeng Wang      2019-11-29  1184  	struct debugfs_entry *en=
try;
198a4ea9768d67 Kefeng Wang      2019-11-29  1185  =

198a4ea9768d67 Kefeng Wang      2019-11-29  1186  	entry =3D kzalloc(sizeof=
(*entry), GFP_KERNEL);
198a4ea9768d67 Kefeng Wang      2019-11-29  1187  	if (!entry)
198a4ea9768d67 Kefeng Wang      2019-11-29  1188  		return ERR_PTR(-ENOMEM);
198a4ea9768d67 Kefeng Wang      2019-11-29  1189  =

198a4ea9768d67 Kefeng Wang      2019-11-29  1190  	entry->read =3D read_fn;
198a4ea9768d67 Kefeng Wang      2019-11-29  1191  	entry->data =3D data;
198a4ea9768d67 Kefeng Wang      2019-11-29  1192  =

198a4ea9768d67 Kefeng Wang      2019-11-29 @1193  	entry =3D debugfs_set_lo=
west_bit(entry);
                                                        ^^^^^^^^
I haven't looked at the surrounding code but how would we free "entry"
when we write over it here?

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2969143337905471966==--

