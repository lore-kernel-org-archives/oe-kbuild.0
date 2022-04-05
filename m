Content-Type: multipart/mixed; boundary="===============1059057446901777273=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 35/40] fs/netfs/buffered_write.c:793 netfs_page_mkwrite() error: uninitialized symbol 'spare_region'.
Date: Tue, 05 Apr 2022 19:27:38 +0800
Message-ID: <202204051945.mr2bveSZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1059057446901777273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
maple
head:   674eea41fc70a740ff83ec590f9833f805852464
commit: fc20927bc9709523b2a53feee2a52423b9d66456 [35/40] netfs: Allow buffe=
red shared-writeable mmap through netfs_page_mkwrite()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20405/202204051945.mr2bveSZ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/buffered_write.c:793 netfs_page_mkwrite() error: uninitialized sym=
bol 'spare_region'.

vim +/spare_region +793 fs/netfs/buffered_write.c

fc20927bc97095 David Howells 2022-02-15  727  =

fc20927bc97095 David Howells 2022-02-15  728  /*
fc20927bc97095 David Howells 2022-02-15  729   * Notification that a previo=
usly read-only page is about to become writable.
fc20927bc97095 David Howells 2022-02-15  730   * Note that the caller indic=
ates a single page of a multipage folio.
fc20927bc97095 David Howells 2022-02-15  731   */
fc20927bc97095 David Howells 2022-02-15  732  vm_fault_t netfs_page_mkwrite=
(struct vm_fault *vmf)
fc20927bc97095 David Howells 2022-02-15  733  {
fc20927bc97095 David Howells 2022-02-15  734  	struct netfs_dirty_region *s=
pare_region;
fc20927bc97095 David Howells 2022-02-15  735  	struct folio *folio =3D page=
_folio(vmf->page);
fc20927bc97095 David Howells 2022-02-15  736  	struct file *file =3D vmf->v=
ma->vm_file;
fc20927bc97095 David Howells 2022-02-15  737  	struct inode *inode =3D file=
_inode(file);
fc20927bc97095 David Howells 2022-02-15  738  	struct netfs_i_context *ctx =
=3D netfs_i_context(inode);
fc20927bc97095 David Howells 2022-02-15  739  	vm_fault_t ret =3D VM_FAULT_=
RETRY;
fc20927bc97095 David Howells 2022-02-15  740  	int err;
fc20927bc97095 David Howells 2022-02-15  741  =

fc20927bc97095 David Howells 2022-02-15  742  	MA_STATE(mas, &ctx->dirty_re=
gions, vmf->page->index, PAGE_SIZE);
fc20927bc97095 David Howells 2022-02-15  743  =

fc20927bc97095 David Howells 2022-02-15  744  	_enter("%lx", folio->index);
fc20927bc97095 David Howells 2022-02-15  745  =

fc20927bc97095 David Howells 2022-02-15  746  	if (ctx->ops->validate_for_w=
rite(inode, file) < 0)
fc20927bc97095 David Howells 2022-02-15  747  		return VM_FAULT_SIGBUS;
fc20927bc97095 David Howells 2022-02-15  748  =

fc20927bc97095 David Howells 2022-02-15  749  	sb_start_pagefault(inode->i_=
sb);
fc20927bc97095 David Howells 2022-02-15  750  =

fc20927bc97095 David Howells 2022-02-15  751  	if (folio_wait_writeback_kil=
lable(folio))
fc20927bc97095 David Howells 2022-02-15  752  		goto out;
fc20927bc97095 David Howells 2022-02-15  753  =

fc20927bc97095 David Howells 2022-02-15  754  	if (folio_lock_killable(foli=
o) < 0)
fc20927bc97095 David Howells 2022-02-15  755  		goto out;
fc20927bc97095 David Howells 2022-02-15  756  =

fc20927bc97095 David Howells 2022-02-15  757  	if (mas_expected_entries(&ma=
s, 2) < 0) {
fc20927bc97095 David Howells 2022-02-15  758  		ret =3D VM_FAULT_OOM;
fc20927bc97095 David Howells 2022-02-15  759  		goto out;
fc20927bc97095 David Howells 2022-02-15  760  	}
fc20927bc97095 David Howells 2022-02-15  761  =

fc20927bc97095 David Howells 2022-02-15  762  	spare_region =3D netfs_alloc=
_dirty_region();
fc20927bc97095 David Howells 2022-02-15  763  	if (IS_ERR(spare_region)) {
fc20927bc97095 David Howells 2022-02-15  764  		ret =3D VM_FAULT_OOM;
fc20927bc97095 David Howells 2022-02-15  765  		goto out;
fc20927bc97095 David Howells 2022-02-15  766  	}
fc20927bc97095 David Howells 2022-02-15  767  =

fc20927bc97095 David Howells 2022-02-15  768  	err =3D netfs_flush_conflict=
ing_writes(ctx, file, folio_pos(folio),
fc20927bc97095 David Howells 2022-02-15  769  					     folio_size(folio), =
folio);
fc20927bc97095 David Howells 2022-02-15  770  	switch (err) {
fc20927bc97095 David Howells 2022-02-15  771  	case 0:
fc20927bc97095 David Howells 2022-02-15  772  		break;
fc20927bc97095 David Howells 2022-02-15  773  	case -EAGAIN:
fc20927bc97095 David Howells 2022-02-15  774  		ret =3D VM_FAULT_RETRY;
fc20927bc97095 David Howells 2022-02-15  775  		goto out;
fc20927bc97095 David Howells 2022-02-15  776  	case -ENOMEM:
fc20927bc97095 David Howells 2022-02-15  777  		ret =3D VM_FAULT_OOM;
fc20927bc97095 David Howells 2022-02-15  778  		goto out;
fc20927bc97095 David Howells 2022-02-15  779  	default:
fc20927bc97095 David Howells 2022-02-15  780  		ret =3D VM_FAULT_SIGBUS;
fc20927bc97095 David Howells 2022-02-15  781  		goto out;
fc20927bc97095 David Howells 2022-02-15  782  	}
fc20927bc97095 David Howells 2022-02-15  783  =

fc20927bc97095 David Howells 2022-02-15  784  	netfs_commit_folio(ctx, file=
, &spare_region, &mas,
fc20927bc97095 David Howells 2022-02-15  785  			   folio, 0, folio_size(fo=
lio));
fc20927bc97095 David Howells 2022-02-15  786  	netfs_commit_region(ctx, &ma=
s, folio_pos(folio), folio_size(folio));
fc20927bc97095 David Howells 2022-02-15  787  	file_update_time(file);
fc20927bc97095 David Howells 2022-02-15  788  =

fc20927bc97095 David Howells 2022-02-15  789  	ret =3D VM_FAULT_LOCKED;
fc20927bc97095 David Howells 2022-02-15  790  out:
fc20927bc97095 David Howells 2022-02-15  791  	sb_end_pagefault(inode->i_sb=
);
fc20927bc97095 David Howells 2022-02-15  792  	mas_destroy(&mas);
fc20927bc97095 David Howells 2022-02-15 @793  	netfs_put_dirty_region(ctx, =
spare_region, netfs_region_trace_put_discard);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1059057446901777273==--

