Content-Type: multipart/mixed; boundary="===============4758684305737086190=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jlayton:ceph-netfs-llist 1/10] fs/netfs/buffered_flush.c:923 netfs_require_flush_group() error: uninitialized symbol 'group'.
Date: Sat, 09 Jul 2022 15:00:39 +0800
Message-ID: <202207091447.3Om783sk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4758684305737086190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git c=
eph-netfs-llist
head:   fd428464b2220bd6c59f0a30f9dadb4720b3efb5
commit: 3d4ae7bbf12af2c1ee8f93df5d6ea3556bdfb6ca [1/10] netfs: Add a write =
context
:::::: branch date: 16 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20709/202207091447.3Om783sk-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/netfs/buffered_flush.c:923 netfs_require_flush_group() error: uninitiali=
zed symbol 'group'.

Old smatch warnings:
fs/netfs/buffered_flush.c:205 netfs_redirty_range() error: uninitialized sy=
mbol 'd2'.
fs/netfs/buffered_flush.c:235 netfs_redirty_range() error: uninitialized sy=
mbol 'd2'.
fs/netfs/buffered_flush.c:376 netfs_check_dirty_list() warn: ignoring unrea=
chable code.
fs/netfs/buffered_flush.c:896 netfs_find_writeback_start() error: uninitial=
ized symbol 'ret'.

vim +/group +923 fs/netfs/buffered_flush.c

2dc27084e13c29 David Howells 2021-06-29  907  =

ce4670495468b7 David Howells 2022-02-07  908  /*
ce4670495468b7 David Howells 2022-02-07  909   * Make sure there's a flush =
group.
ce4670495468b7 David Howells 2022-02-07  910   */
3d4ae7bbf12af2 David Howells 2022-07-07  911  int netfs_require_flush_group=
(struct netfs_write_context *write, bool force)
ce4670495468b7 David Howells 2022-02-07  912  {
ce4670495468b7 David Howells 2022-02-07  913  	struct netfs_flush_group *gr=
oup;
3d4ae7bbf12af2 David Howells 2022-07-07  914  	struct netfs_inode *ctx =3D =
write->ctx;
ce4670495468b7 David Howells 2022-02-07  915  =

ce4670495468b7 David Howells 2022-02-07  916  	if (list_empty(&ctx->flush_g=
roups) || force) {
ce4670495468b7 David Howells 2022-02-07  917  		kdebug("new flush group");
3d4ae7bbf12af2 David Howells 2022-07-07  918  		group =3D netfs_new_flush_g=
roup(ctx, NULL);
ce4670495468b7 David Howells 2022-02-07  919  		if (!group)
ce4670495468b7 David Howells 2022-02-07  920  			return -ENOMEM;
ce4670495468b7 David Howells 2022-02-07  921  	}
3d4ae7bbf12af2 David Howells 2022-07-07  922  =

3d4ae7bbf12af2 David Howells 2022-07-07 @923  	write->flush_group =3D group;
ce4670495468b7 David Howells 2022-02-07  924  	return 0;
ce4670495468b7 David Howells 2022-02-07  925  }
ce4670495468b7 David Howells 2022-02-07  926  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4758684305737086190==--

