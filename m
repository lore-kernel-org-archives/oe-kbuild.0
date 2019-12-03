Content-Type: multipart/mixed; boundary="===============2121457763561411458=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [kbuild-all] Re: [PATCH next 2/3] debugfs: introduce debugfs_create_single[, _data]
Date: Tue, 03 Dec 2019 17:02:54 +0800
Message-ID: <06d63c3c-bab5-c19e-a51d-ac7c1ed0a80c@intel.com>
In-Reply-To: <20191203083847.GC1787@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2121457763561411458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/3/19 4:38 PM, Dan Carpenter wrote:
> [ How do I fetch 0day git branchs?
>    git fetch https://github.com/0day-ci/linux/commits/Kefeng-Wang/debugfs=
-introduce-debugfs_create_single-seq-_data/20191129-173440
>    doesn't work. - dan ]

Hi Dan,

I can fetch it by the following steps:

nfs(a)shao2-debian:~/linux$ git remote add 0day-linux-review =

https://github.com/0day-ci/linux.git
nfs(a)shao2-debian:~/linux$ git fetch --no-tags 0day-linux-review =

Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_data/20191129-1734=
40 =


remote: Enumerating objects: 25261, done.
remote: Counting objects: 100% (25261/25261), done.
remote: Total 33246 (delta 25260), reused 25260 (delta 25260), =

pack-reused 7985
Receiving objects: 100% (33246/33246), 12.03 MiB | 1.05 MiB/s, done.
Resolving deltas: 100% (28148/28148), completed with 6149 local objects.
 From https://github.com/0day-ci/linux
 =C2=A0* branch =

Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_data/20191129-1734=
40 =

-> FETCH_HEAD
 =C2=A0* [new branch] =

Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_data/20191129-1734=
40 =

-> =

0day-linux-review/Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_=
data/20191129-173440

Best Regards,
Rong Chen

>
> Hi Kefeng,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on next-20191128]
> [cannot apply to v5.4]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Kefeng-Wang/debugfs-intr=
oduce-debugfs_create_single-seq-_data/20191129-173440
> base:    d26b0e226f222c22c3b7e9d16e5b886e7c51057a
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> fs/debugfs/file.c:1193 debugfs_create_single_data() warn: overwrite may l=
eak 'entry'
>
> Old smatch warnings:
> include/linux/compiler.h:247 __write_once_size() warn: potential memory c=
orrupting cast 8 vs 4 bytes
>
> # https://github.com/0day-ci/linux/commit/198a4ea9768d6790a169e8b802e702c=
208aafbd1
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout 198a4ea9768d6790a169e8b802e702c208aafbd1
> vim +/entry +1193 fs/debugfs/file.c
>
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1179  struct dentry *debugfs_=
create_single_data(const char *name, umode_t mode,
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1180  					  struct dentry *p=
arent, void *data,
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1181  					  int (*read_fn)(s=
truct seq_file *s,
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1182  							 void *data))
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1183  {
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1184  	struct debugfs_entry *=
entry;
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1185
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1186  	entry =3D kzalloc(size=
of(*entry), GFP_KERNEL);
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1187  	if (!entry)
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1188  		return ERR_PTR(-ENOME=
M);
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1189
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1190  	entry->read =3D read_f=
n;
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1191  	entry->data =3D data;
> 198a4ea9768d67 Kefeng Wang      2019-11-29  1192
> 198a4ea9768d67 Kefeng Wang      2019-11-29 @1193  	entry =3D debugfs_set_=
lowest_bit(entry);
>                                                          ^^^^^^^^
> I haven't looked at the surrounding code but how would we free "entry"
> when we write over it here?
>
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology C=
enter
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corp=
oration
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============2121457763561411458==--

