Content-Type: multipart/mixed; boundary="===============7161016758932709382=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [brauner:loopfs_v1 2/8] drivers/block/loopfs/loopfs.c:401:6: warning: Redundant initialization for 'ctx'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Tue, 14 Apr 2020 07:10:19 +0800
Message-ID: <202004140743.lqrKdqWk%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7161016758932709382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christian Brauner <christian.brauner@ubuntu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git l=
oopfs_v1
head:   e3796aa0ebdf297c4a3273c64aed421530d8a1e3
commit: 36eb087fffce637de710a065ce6ccf9d7b83d08a [2/8] loopfs: implement lo=
opfs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/block/loopfs/loopfs.c:401:6: warning: Redundant initialization f=
or 'ctx'. The initialized value is overwritten before it is read. [redundan=
tInitialization]
    ctx =3D kzalloc(sizeof(struct loopfs_mount_opts), GFP_KERNEL);
        ^
   drivers/block/loopfs/loopfs.c:399:32: note: ctx is initialized
    struct loopfs_mount_opts *ctx =3D fc->fs_private;
                                  ^
   drivers/block/loopfs/loopfs.c:401:6: note: ctx is overwritten
    ctx =3D kzalloc(sizeof(struct loopfs_mount_opts), GFP_KERNEL);
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/=
?id=3D36eb087fffce637de710a065ce6ccf9d7b83d08a
git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brau=
ner/linux.git
git remote update brauner
git checkout 36eb087fffce637de710a065ce6ccf9d7b83d08a
vim +/ctx +401 drivers/block/loopfs/loopfs.c

36eb087fffce63 Christian Brauner 2020-04-02  396  =

36eb087fffce63 Christian Brauner 2020-04-02  397  static int loopfs_init_fs=
_context(struct fs_context *fc)
36eb087fffce63 Christian Brauner 2020-04-02  398  {
36eb087fffce63 Christian Brauner 2020-04-02  399  	struct loopfs_mount_opts=
 *ctx =3D fc->fs_private;
36eb087fffce63 Christian Brauner 2020-04-02  400  =

36eb087fffce63 Christian Brauner 2020-04-02 @401  	ctx =3D kzalloc(sizeof(s=
truct loopfs_mount_opts), GFP_KERNEL);
36eb087fffce63 Christian Brauner 2020-04-02  402  	if (!ctx)
36eb087fffce63 Christian Brauner 2020-04-02  403  		return -ENOMEM;
36eb087fffce63 Christian Brauner 2020-04-02  404  =

36eb087fffce63 Christian Brauner 2020-04-02  405  	ctx->max =3D max_devices;
36eb087fffce63 Christian Brauner 2020-04-02  406  =

36eb087fffce63 Christian Brauner 2020-04-02  407  	fc->fs_private =3D ctx;
36eb087fffce63 Christian Brauner 2020-04-02  408  =

36eb087fffce63 Christian Brauner 2020-04-02  409  	fc->ops =3D &loopfs_fs_c=
ontext_ops;
36eb087fffce63 Christian Brauner 2020-04-02  410  =

36eb087fffce63 Christian Brauner 2020-04-02  411  	return 0;
36eb087fffce63 Christian Brauner 2020-04-02  412  }
36eb087fffce63 Christian Brauner 2020-04-02  413  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7161016758932709382==--

