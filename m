Content-Type: multipart/mixed; boundary="===============5105045356843782648=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 3/4] ext4: factor out write end code of inline file
Date: Tue, 06 Jul 2021 13:13:25 +0800
Message-ID: <202107061343.3Xqae8Rz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5105045356843782648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210706024210.746788-4-yi.zhang@huawei.com>
References: <20210706024210.746788-4-yi.zhang@huawei.com>
TO: Zhang Yi <yi.zhang@huawei.com>

Hi Zhang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on ext4/dev]
[also build test WARNING on v5.13 next-20210701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhang-Yi/ext4-improve-dela=
lloc-buffer-write-performance/20210706-103431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

                         ^
>> fs/ext4/inline.c:793:7: warning: Uninitialized variable: ret [uninitvar]
    if (!ret)
         ^
   fs/ext4/inline.c:747:4: warning: Identical inner 'if' condition is alway=
s true. [identicalInnerCondition]
      ext4_std_error(inode->i_sb, ret);
      ^
   fs/ext4/inline.c:744:7: note: outer condition: ret
     if (ret) {
         ^
   fs/ext4/inline.c:747:4: note: identical inner condition: ret
      ext4_std_error(inode->i_sb, ret);
      ^
   fs/ext4/inline.c:819:3: warning: Identical inner 'if' condition is alway=
s true. [identicalInnerCondition]
     ext4_std_error(inode->i_sb, ret);
     ^
   fs/ext4/inline.c:818:6: note: outer condition: ret
    if (ret) {
        ^
   fs/ext4/inline.c:819:3: note: identical inner condition: ret
     ext4_std_error(inode->i_sb, ret);
     ^

vim +793 fs/ext4/inline.c

f19d5870cbf72d Tao Ma        2012-12-10  728  =

f19d5870cbf72d Tao Ma        2012-12-10  729  int ext4_write_inline_data_en=
d(struct inode *inode, loff_t pos, unsigned len,
f19d5870cbf72d Tao Ma        2012-12-10  730  			       unsigned copied, st=
ruct page *page)
f19d5870cbf72d Tao Ma        2012-12-10  731  {
b6bfc15d82616d Zhang Yi      2021-07-06  732  	handle_t *handle =3D ext4_jo=
urnal_current_handle();
b6bfc15d82616d Zhang Yi      2021-07-06  733  	int i_size_changed =3D 0;
b6bfc15d82616d Zhang Yi      2021-07-06  734  	int no_expand;
f19d5870cbf72d Tao Ma        2012-12-10  735  	void *kaddr;
f19d5870cbf72d Tao Ma        2012-12-10  736  	struct ext4_iloc iloc;
b6bfc15d82616d Zhang Yi      2021-07-06  737  	int ret, ret2;
f19d5870cbf72d Tao Ma        2012-12-10  738  =

4dfba1ee616130 Zhang Yi      2021-07-06  739  	if (unlikely(copied < len) &=
& !PageUptodate(page))
b6bfc15d82616d Zhang Yi      2021-07-06  740  		copied =3D 0;
f19d5870cbf72d Tao Ma        2012-12-10  741  =

b6bfc15d82616d Zhang Yi      2021-07-06  742  	if (likely(copied)) {
f19d5870cbf72d Tao Ma        2012-12-10  743  		ret =3D ext4_get_inode_loc(=
inode, &iloc);
f19d5870cbf72d Tao Ma        2012-12-10  744  		if (ret) {
b6bfc15d82616d Zhang Yi      2021-07-06  745  			unlock_page(page);
b6bfc15d82616d Zhang Yi      2021-07-06  746  			put_page(page);
f19d5870cbf72d Tao Ma        2012-12-10  747  			ext4_std_error(inode->i_sb=
, ret);
b6bfc15d82616d Zhang Yi      2021-07-06  748  			goto out;
f19d5870cbf72d Tao Ma        2012-12-10  749  		}
c755e251357a0c Theodore Ts'o 2017-01-11  750  		ext4_write_lock_xattr(inode=
, &no_expand);
f19d5870cbf72d Tao Ma        2012-12-10  751  		BUG_ON(!ext4_has_inline_dat=
a(inode));
f19d5870cbf72d Tao Ma        2012-12-10  752  =

f19d5870cbf72d Tao Ma        2012-12-10  753  		kaddr =3D kmap_atomic(page);
4dfba1ee616130 Zhang Yi      2021-07-06  754  		ext4_write_inline_data(inod=
e, &iloc, kaddr, pos, copied);
f19d5870cbf72d Tao Ma        2012-12-10  755  		kunmap_atomic(kaddr);
f19d5870cbf72d Tao Ma        2012-12-10  756  		SetPageUptodate(page);
f19d5870cbf72d Tao Ma        2012-12-10  757  		/* clear page dirty so that=
 writepages wouldn't work for us. */
f19d5870cbf72d Tao Ma        2012-12-10  758  		ClearPageDirty(page);
f19d5870cbf72d Tao Ma        2012-12-10  759  =

c755e251357a0c Theodore Ts'o 2017-01-11  760  		ext4_write_unlock_xattr(ino=
de, &no_expand);
f19d5870cbf72d Tao Ma        2012-12-10  761  		brelse(iloc.bh);
b6bfc15d82616d Zhang Yi      2021-07-06  762  	}
b6bfc15d82616d Zhang Yi      2021-07-06  763  =

b6bfc15d82616d Zhang Yi      2021-07-06  764  	/*
b6bfc15d82616d Zhang Yi      2021-07-06  765  	 * It's important to update =
i_size while still holding page lock:
b6bfc15d82616d Zhang Yi      2021-07-06  766  	 * page writeout could other=
wise come in and zero beyond i_size.
b6bfc15d82616d Zhang Yi      2021-07-06  767  	 */
b6bfc15d82616d Zhang Yi      2021-07-06  768  	i_size_changed =3D ext4_upda=
te_inode_size(inode, pos + copied);
b6bfc15d82616d Zhang Yi      2021-07-06  769  	if (ext4_should_journal_data=
(inode)) {
b6bfc15d82616d Zhang Yi      2021-07-06  770  		ext4_set_inode_state(inode,=
 EXT4_STATE_JDATA);
b6bfc15d82616d Zhang Yi      2021-07-06  771  		EXT4_I(inode)->i_datasync_t=
id =3D handle->h_transaction->t_tid;
b6bfc15d82616d Zhang Yi      2021-07-06  772  	}
b6bfc15d82616d Zhang Yi      2021-07-06  773  	unlock_page(page);
b6bfc15d82616d Zhang Yi      2021-07-06  774  	put_page(page);
b6bfc15d82616d Zhang Yi      2021-07-06  775  =

b6bfc15d82616d Zhang Yi      2021-07-06  776  	/*
b6bfc15d82616d Zhang Yi      2021-07-06  777  	 * Don't mark the inode dirt=
y under page lock. First, it unnecessarily
b6bfc15d82616d Zhang Yi      2021-07-06  778  	 * makes the holding time of=
 page lock longer. Second, it forces lock
b6bfc15d82616d Zhang Yi      2021-07-06  779  	 * ordering of page lock and=
 transaction start for journaling
b6bfc15d82616d Zhang Yi      2021-07-06  780  	 * filesystems.
b6bfc15d82616d Zhang Yi      2021-07-06  781  	 */
b6bfc15d82616d Zhang Yi      2021-07-06  782  	if (likely(copied) || i_size=
_changed)
362eca70b53389 Theodore Ts'o 2018-07-10  783  		mark_inode_dirty(inode);
b6bfc15d82616d Zhang Yi      2021-07-06  784  out:
b6bfc15d82616d Zhang Yi      2021-07-06  785  	/*
b6bfc15d82616d Zhang Yi      2021-07-06  786  	 * If we have allocated more=
 blocks and copied less. We will have
b6bfc15d82616d Zhang Yi      2021-07-06  787  	 * blocks allocated outside =
inode->i_size, so truncate them.
b6bfc15d82616d Zhang Yi      2021-07-06  788  	 */
b6bfc15d82616d Zhang Yi      2021-07-06  789  	if (pos + len > inode->i_siz=
e && ext4_can_truncate(inode))
b6bfc15d82616d Zhang Yi      2021-07-06  790  		ext4_orphan_add(handle, ino=
de);
4dfba1ee616130 Zhang Yi      2021-07-06  791  =

b6bfc15d82616d Zhang Yi      2021-07-06  792  	ret2 =3D ext4_journal_stop(h=
andle);
b6bfc15d82616d Zhang Yi      2021-07-06 @793  	if (!ret)
b6bfc15d82616d Zhang Yi      2021-07-06  794  		ret =3D ret2;
b6bfc15d82616d Zhang Yi      2021-07-06  795  	if (pos + len > inode->i_siz=
e) {
b6bfc15d82616d Zhang Yi      2021-07-06  796  		ext4_truncate_failed_write(=
inode);
b6bfc15d82616d Zhang Yi      2021-07-06  797  		/*
b6bfc15d82616d Zhang Yi      2021-07-06  798  		 * If truncate failed early=
 the inode might still be
b6bfc15d82616d Zhang Yi      2021-07-06  799  		 * on the orphan list; we n=
eed to make sure the inode
b6bfc15d82616d Zhang Yi      2021-07-06  800  		 * is removed from the orph=
an list in that case.
b6bfc15d82616d Zhang Yi      2021-07-06  801  		 */
b6bfc15d82616d Zhang Yi      2021-07-06  802  		if (inode->i_nlink)
b6bfc15d82616d Zhang Yi      2021-07-06  803  			ext4_orphan_del(NULL, inod=
e);
b6bfc15d82616d Zhang Yi      2021-07-06  804  	}
b6bfc15d82616d Zhang Yi      2021-07-06  805  	return ret ? ret : copied;
f19d5870cbf72d Tao Ma        2012-12-10  806  }
f19d5870cbf72d Tao Ma        2012-12-10  807  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5105045356843782648==--

