Content-Type: multipart/mixed; boundary="===============5511288846913306636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/inode.c:5477:3: warning: Identical inner 'if' condition is always true.
Date: Wed, 10 Feb 2021 19:40:28 +0800
Message-ID: <202102101903.eVHdPkiZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5511288846913306636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e0756cfc7d7cd08c98a53b6009c091a3f6a50be6
commit: aa75f4d3daaeb1389b9cce9d6b84401eaf228d4e ext4: main fast-commit com=
mit path
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/ext4/ext4.h:586:2: warning: Shifting signed 32-bit value by 31 bits i=
s undefined behaviour [shiftTooManyBitsSigned]
    CHECK_FLAG_VALUE(RESERVED);
    ^
>> fs/ext4/inode.c:5477:3: warning: Identical inner 'if' condition is alway=
s true. [identicalInnerCondition]
     ext4_std_error(inode->i_sb, error);
     ^
   fs/ext4/inode.c:5476:7: note: outer condition: error
    if  (error)
         ^
   fs/ext4/inode.c:5477:3: note: identical inner condition: error
     ext4_std_error(inode->i_sb, error);
     ^

vim +/if +5477 fs/ext4/inode.c

53e872681fed6a Jan Kara           2012-12-25  5243  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  5244  /*
617ba13b31fbf5 Mingming Cao       2006-10-11  5245   * ext4_setattr()
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5246   *
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5247   * Called from notify_c=
hange.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5248   *
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5249   * We want to trap VFS =
attempts to truncate the file as soon as
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5250   * possible.  In partic=
ular, we want to make sure that when the VFS
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5251   * shrinks i_size, we p=
ut the inode on the orphan list and modify
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5252   * i_disksize immediate=
ly, so that during the subsequent flushing of
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5253   * dirty pages and free=
ing of disk blocks, we can guarantee that any
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5254   * commit will leave th=
e blocks being flushed in an unused state on
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5255   * disk.  (On recovery,=
 the inode will get truncated and the blocks will
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5256   * be freed, so we have=
 a strong guarantee that no future commit will
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5257   * leave these blocks v=
isible to the user.)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5258   *
678aaf481496b0 Jan Kara           2008-07-11  5259   * Another thing we hav=
e to assure is that if we are in ordered mode
678aaf481496b0 Jan Kara           2008-07-11  5260   * and inode is still a=
ttached to the committing transaction, we must
678aaf481496b0 Jan Kara           2008-07-11  5261   * we start writeout of=
 all the dirty pages which are being truncated.
678aaf481496b0 Jan Kara           2008-07-11  5262   * This way we are sure=
 that all the data written in the previous
678aaf481496b0 Jan Kara           2008-07-11  5263   * transaction are alre=
ady on disk (truncate waits for pages under
678aaf481496b0 Jan Kara           2008-07-11  5264   * writeback).
678aaf481496b0 Jan Kara           2008-07-11  5265   *
678aaf481496b0 Jan Kara           2008-07-11  5266   * Called with inode->i=
_mutex down.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5267   */
617ba13b31fbf5 Mingming Cao       2006-10-11  5268  int ext4_setattr(struct=
 dentry *dentry, struct iattr *attr)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5269  {
2b0143b5c986be David Howells      2015-03-17  5270  	struct inode *inode =
=3D d_inode(dentry);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5271  	int error, rc =3D 0;
3d287de3b82822 Dmitry Monakhov    2010-10-27  5272  	int orphan =3D 0;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5273  	const unsigned int ia_=
valid =3D attr->ia_valid;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5274  =

0db1ff222d40f1 Theodore Ts'o      2017-02-05  5275  	if (unlikely(ext4_forc=
ed_shutdown(EXT4_SB(inode->i_sb))))
0db1ff222d40f1 Theodore Ts'o      2017-02-05  5276  		return -EIO;
0db1ff222d40f1 Theodore Ts'o      2017-02-05  5277  =

02b016ca7f9922 Theodore Ts'o      2019-06-09  5278  	if (unlikely(IS_IMMUTA=
BLE(inode)))
02b016ca7f9922 Theodore Ts'o      2019-06-09  5279  		return -EPERM;
02b016ca7f9922 Theodore Ts'o      2019-06-09  5280  =

02b016ca7f9922 Theodore Ts'o      2019-06-09  5281  	if (unlikely(IS_APPEND=
(inode) &&
02b016ca7f9922 Theodore Ts'o      2019-06-09  5282  		     (ia_valid & (ATT=
R_MODE | ATTR_UID |
02b016ca7f9922 Theodore Ts'o      2019-06-09  5283  				  ATTR_GID | ATTR_T=
IMES_SET))))
02b016ca7f9922 Theodore Ts'o      2019-06-09  5284  		return -EPERM;
02b016ca7f9922 Theodore Ts'o      2019-06-09  5285  =

31051c85b5e2aa Jan Kara           2016-05-26  5286  	error =3D setattr_prep=
are(dentry, attr);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5287  	if (error)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5288  		return error;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5289  =

3ce2b8ddd84d50 Eric Biggers       2017-10-18  5290  	error =3D fscrypt_prep=
are_setattr(dentry, attr);
3ce2b8ddd84d50 Eric Biggers       2017-10-18  5291  	if (error)
3ce2b8ddd84d50 Eric Biggers       2017-10-18  5292  		return error;
3ce2b8ddd84d50 Eric Biggers       2017-10-18  5293  =

c93d8f88580921 Eric Biggers       2019-07-22  5294  	error =3D fsverity_pre=
pare_setattr(dentry, attr);
c93d8f88580921 Eric Biggers       2019-07-22  5295  	if (error)
c93d8f88580921 Eric Biggers       2019-07-22  5296  		return error;
c93d8f88580921 Eric Biggers       2019-07-22  5297  =

a7cdadee0e8948 Jan Kara           2015-06-29  5298  	if (is_quota_modificat=
ion(inode, attr)) {
a7cdadee0e8948 Jan Kara           2015-06-29  5299  		error =3D dquot_initi=
alize(inode);
a7cdadee0e8948 Jan Kara           2015-06-29  5300  		if (error)
a7cdadee0e8948 Jan Kara           2015-06-29  5301  			return error;
a7cdadee0e8948 Jan Kara           2015-06-29  5302  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5303  	ext4_fc_start_update(i=
node);
08cefc7ab839cf Eric W. Biederman  2012-02-07  5304  	if ((ia_valid & ATTR_U=
ID && !uid_eq(attr->ia_uid, inode->i_uid)) ||
08cefc7ab839cf Eric W. Biederman  2012-02-07  5305  	    (ia_valid & ATTR_G=
ID && !gid_eq(attr->ia_gid, inode->i_gid))) {
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5306  		handle_t *handle;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5307  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  5308  		/* (user+group)*(old+=
new) structure, inode write (sb,
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5309  		 * inode block, ? - b=
ut truncate inode update has it) */
9924a92a8c2175 Theodore Ts'o      2013-02-08  5310  		handle =3D ext4_journ=
al_start(inode, EXT4_HT_QUOTA,
9924a92a8c2175 Theodore Ts'o      2013-02-08  5311  			(EXT4_MAXQUOTAS_INIT=
_BLOCKS(inode->i_sb) +
194074acacebc1 Dmitry Monakhov    2009-12-08  5312  			 EXT4_MAXQUOTAS_DEL_=
BLOCKS(inode->i_sb)) + 3);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5313  		if (IS_ERR(handle)) {
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5314  			error =3D PTR_ERR(ha=
ndle);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5315  			goto err_out;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5316  		}
7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5317  =

7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5318  		/* dquot_transfer() c=
alls back ext4_get_inode_usage() which
7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5319  		 * counts xattr inode=
 references.
7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5320  		 */
7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5321  		down_read(&EXT4_I(ino=
de)->xattr_sem);
b43fa8284d7790 Christoph Hellwig  2010-03-03  5322  		error =3D dquot_trans=
fer(inode, attr);
7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5323  		up_read(&EXT4_I(inode=
)->xattr_sem);
7a9ca53aea10ad Tahsin Erdogan     2017-06-22  5324  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  5325  		if (error) {
617ba13b31fbf5 Mingming Cao       2006-10-11  5326  			ext4_journal_stop(ha=
ndle);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5327  			ext4_fc_stop_update(=
inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5328  			return error;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5329  		}
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5330  		/* Update correspondi=
ng info in inode so that everything is in
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5331  		 * one transaction */
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5332  		if (attr->ia_valid & =
ATTR_UID)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5333  			inode->i_uid =3D att=
r->ia_uid;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5334  		if (attr->ia_valid & =
ATTR_GID)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5335  			inode->i_gid =3D att=
r->ia_gid;
617ba13b31fbf5 Mingming Cao       2006-10-11  5336  		error =3D ext4_mark_i=
node_dirty(handle, inode);
617ba13b31fbf5 Mingming Cao       2006-10-11  5337  		ext4_journal_stop(han=
dle);
4209ae12b12265 Harshad Shirwadkar 2020-04-26  5338  		if (unlikely(error))
4209ae12b12265 Harshad Shirwadkar 2020-04-26  5339  			return error;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5340  	}
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5341  =

3da40c7b089810 Josef Bacik        2015-06-22  5342  	if (attr->ia_valid & A=
TTR_SIZE) {
5208386c501276 Jan Kara           2013-08-17  5343  		handle_t *handle;
3da40c7b089810 Josef Bacik        2015-06-22  5344  		loff_t oldsize =3D in=
ode->i_size;
b9c1c26739ec2d Jan Kara           2019-05-30  5345  		int shrink =3D (attr-=
>ia_size < inode->i_size);
562c72aa57c36b Christoph Hellwig  2011-06-24  5346  =

12e9b892002d9a Dmitry Monakhov    2010-05-16  5347  		if (!(ext4_test_inode=
_flag(inode, EXT4_INODE_EXTENTS))) {
e2b4657453c0d5 Eric Sandeen       2008-01-28  5348  			struct ext4_sb_info =
*sbi =3D EXT4_SB(inode->i_sb);
e2b4657453c0d5 Eric Sandeen       2008-01-28  5349  =

aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5350  			if (attr->ia_size > =
sbi->s_bitmap_maxbytes) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5351  				ext4_fc_stop_update=
(inode);
0c095c7f113e9f Theodore Ts'o      2010-07-27  5352  				return -EFBIG;
e2b4657453c0d5 Eric Sandeen       2008-01-28  5353  			}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5354  		}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5355  		if (!S_ISREG(inode->i=
_mode)) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5356  			ext4_fc_stop_update(=
inode);
3da40c7b089810 Josef Bacik        2015-06-22  5357  			return -EINVAL;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5358  		}
dff6efc326a4d5 Christoph Hellwig  2013-11-19  5359  =

dff6efc326a4d5 Christoph Hellwig  2013-11-19  5360  		if (IS_I_VERSION(inod=
e) && attr->ia_size !=3D inode->i_size)
dff6efc326a4d5 Christoph Hellwig  2013-11-19  5361  			inode_inc_iversion(i=
node);
dff6efc326a4d5 Christoph Hellwig  2013-11-19  5362  =

b9c1c26739ec2d Jan Kara           2019-05-30  5363  		if (shrink) {
b9c1c26739ec2d Jan Kara           2019-05-30  5364  			if (ext4_should_orde=
r_data(inode)) {
5208386c501276 Jan Kara           2013-08-17  5365  				error =3D ext4_begi=
n_ordered_truncate(inode,
5208386c501276 Jan Kara           2013-08-17  5366  							    attr->ia_siz=
e);
5208386c501276 Jan Kara           2013-08-17  5367  				if (error)
5208386c501276 Jan Kara           2013-08-17  5368  					goto err_out;
5208386c501276 Jan Kara           2013-08-17  5369  			}
b9c1c26739ec2d Jan Kara           2019-05-30  5370  			/*
b9c1c26739ec2d Jan Kara           2019-05-30  5371  			 * Blocks are going =
to be removed from the inode. Wait
b9c1c26739ec2d Jan Kara           2019-05-30  5372  			 * for dio in flight.
b9c1c26739ec2d Jan Kara           2019-05-30  5373  			 */
b9c1c26739ec2d Jan Kara           2019-05-30  5374  			inode_dio_wait(inode=
);
b9c1c26739ec2d Jan Kara           2019-05-30  5375  		}
b9c1c26739ec2d Jan Kara           2019-05-30  5376  =

b9c1c26739ec2d Jan Kara           2019-05-30  5377  		down_write(&EXT4_I(in=
ode)->i_mmap_sem);
b9c1c26739ec2d Jan Kara           2019-05-30  5378  =

b9c1c26739ec2d Jan Kara           2019-05-30  5379  		rc =3D ext4_break_lay=
outs(inode);
b9c1c26739ec2d Jan Kara           2019-05-30  5380  		if (rc) {
b9c1c26739ec2d Jan Kara           2019-05-30  5381  			up_write(&EXT4_I(ino=
de)->i_mmap_sem);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5382  			goto err_out;
b9c1c26739ec2d Jan Kara           2019-05-30  5383  		}
b9c1c26739ec2d Jan Kara           2019-05-30  5384  =

3da40c7b089810 Josef Bacik        2015-06-22  5385  		if (attr->ia_size !=
=3D inode->i_size) {
9924a92a8c2175 Theodore Ts'o      2013-02-08  5386  			handle =3D ext4_jour=
nal_start(inode, EXT4_HT_INODE, 3);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5387  			if (IS_ERR(handle)) {
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5388  				error =3D PTR_ERR(h=
andle);
b9c1c26739ec2d Jan Kara           2019-05-30  5389  				goto out_mmap_sem;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5390  			}
3da40c7b089810 Josef Bacik        2015-06-22  5391  			if (ext4_handle_vali=
d(handle) && shrink) {
617ba13b31fbf5 Mingming Cao       2006-10-11  5392  				error =3D ext4_orph=
an_add(handle, inode);
3d287de3b82822 Dmitry Monakhov    2010-10-27  5393  				orphan =3D 1;
3d287de3b82822 Dmitry Monakhov    2010-10-27  5394  			}
911af577de4e44 Eryu Guan          2015-07-28  5395  			/*
911af577de4e44 Eryu Guan          2015-07-28  5396  			 * Update c/mtime on=
 truncate up, ext4_truncate() will
911af577de4e44 Eryu Guan          2015-07-28  5397  			 * update c/mtime in=
 shrink case below
911af577de4e44 Eryu Guan          2015-07-28  5398  			 */
911af577de4e44 Eryu Guan          2015-07-28  5399  			if (!shrink) {
eeca7ea1baa939 Deepa Dinamani     2016-11-14  5400  				inode->i_mtime =3D =
current_time(inode);
911af577de4e44 Eryu Guan          2015-07-28  5401  				inode->i_ctime =3D =
inode->i_mtime;
911af577de4e44 Eryu Guan          2015-07-28  5402  			}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5403  =

aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5404  			if (shrink)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5405  				ext4_fc_track_range=
(inode,
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5406  					(attr->ia_size > 0=
 ? attr->ia_size - 1 : 0) >>
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5407  					inode->i_sb->s_blo=
cksize_bits,
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5408  					(oldsize > 0 ? old=
size - 1 : 0) >>
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5409  					inode->i_sb->s_blo=
cksize_bits);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5410  			else
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5411  				ext4_fc_track_range(
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5412  					inode,
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5413  					(oldsize > 0 ? old=
size - 1 : oldsize) >>
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5414  					inode->i_sb->s_blo=
cksize_bits,
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5415  					(attr->ia_size > 0=
 ? attr->ia_size - 1 : 0) >>
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5416  					inode->i_sb->s_blo=
cksize_bits);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5417  =

90e775b71ac4e6 Jan Kara           2013-08-17  5418  			down_write(&EXT4_I(i=
node)->i_data_sem);
617ba13b31fbf5 Mingming Cao       2006-10-11  5419  			EXT4_I(inode)->i_dis=
ksize =3D attr->ia_size;
617ba13b31fbf5 Mingming Cao       2006-10-11  5420  			rc =3D ext4_mark_ino=
de_dirty(handle, inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5421  			if (!error)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5422  				error =3D rc;
90e775b71ac4e6 Jan Kara           2013-08-17  5423  			/*
90e775b71ac4e6 Jan Kara           2013-08-17  5424  			 * We have to update=
 i_size under i_data_sem together
90e775b71ac4e6 Jan Kara           2013-08-17  5425  			 * with i_disksize t=
o avoid races with writeback code
90e775b71ac4e6 Jan Kara           2013-08-17  5426  			 * running ext4_wb_u=
pdate_i_disksize().
90e775b71ac4e6 Jan Kara           2013-08-17  5427  			 */
90e775b71ac4e6 Jan Kara           2013-08-17  5428  			if (!error)
90e775b71ac4e6 Jan Kara           2013-08-17  5429  				i_size_write(inode,=
 attr->ia_size);
90e775b71ac4e6 Jan Kara           2013-08-17  5430  			up_write(&EXT4_I(ino=
de)->i_data_sem);
617ba13b31fbf5 Mingming Cao       2006-10-11  5431  			ext4_journal_stop(ha=
ndle);
b9c1c26739ec2d Jan Kara           2019-05-30  5432  			if (error)
b9c1c26739ec2d Jan Kara           2019-05-30  5433  				goto out_mmap_sem;
82a25b027ca48d Jan Kara           2019-05-23  5434  			if (!shrink) {
b9c1c26739ec2d Jan Kara           2019-05-30  5435  				pagecache_isize_ext=
ended(inode, oldsize,
b9c1c26739ec2d Jan Kara           2019-05-30  5436  							 inode->i_size);
b9c1c26739ec2d Jan Kara           2019-05-30  5437  			} else if (ext4_shou=
ld_journal_data(inode)) {
82a25b027ca48d Jan Kara           2019-05-23  5438  				ext4_wait_for_tail_=
page_commit(inode);
b9c1c26739ec2d Jan Kara           2019-05-30  5439  			}
430657b6be896d Ross Zwisler       2018-07-29  5440  		}
430657b6be896d Ross Zwisler       2018-07-29  5441  =

53e872681fed6a Jan Kara           2012-12-25  5442  		/*
53e872681fed6a Jan Kara           2012-12-25  5443  		 * Truncate pagecache=
 after we've waited for commit
53e872681fed6a Jan Kara           2012-12-25  5444  		 * in data=3Djournal =
mode to make pages freeable.
53e872681fed6a Jan Kara           2012-12-25  5445  		 */
7caef26767c172 Kirill A. Shutemov 2013-09-12  5446  		truncate_pagecache(in=
ode, inode->i_size);
b9c1c26739ec2d Jan Kara           2019-05-30  5447  		/*
b9c1c26739ec2d Jan Kara           2019-05-30  5448  		 * Call ext4_truncate=
() even if i_size didn't change to
b9c1c26739ec2d Jan Kara           2019-05-30  5449  		 * truncate possible =
preallocated blocks.
b9c1c26739ec2d Jan Kara           2019-05-30  5450  		 */
b9c1c26739ec2d Jan Kara           2019-05-30  5451  		if (attr->ia_size <=
=3D oldsize) {
2c98eb5ea24976 Theodore Ts'o      2016-11-13  5452  			rc =3D ext4_truncate=
(inode);
2c98eb5ea24976 Theodore Ts'o      2016-11-13  5453  			if (rc)
2c98eb5ea24976 Theodore Ts'o      2016-11-13  5454  				error =3D rc;
2c98eb5ea24976 Theodore Ts'o      2016-11-13  5455  		}
b9c1c26739ec2d Jan Kara           2019-05-30  5456  out_mmap_sem:
ea3d7209ca01da Jan Kara           2015-12-07  5457  		up_write(&EXT4_I(inod=
e)->i_mmap_sem);
3da40c7b089810 Josef Bacik        2015-06-22  5458  	}
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5459  =

2c98eb5ea24976 Theodore Ts'o      2016-11-13  5460  	if (!error) {
1025774ce411f2 Christoph Hellwig  2010-06-04  5461  		setattr_copy(inode, a=
ttr);
1025774ce411f2 Christoph Hellwig  2010-06-04  5462  		mark_inode_dirty(inod=
e);
1025774ce411f2 Christoph Hellwig  2010-06-04  5463  	}
1025774ce411f2 Christoph Hellwig  2010-06-04  5464  =

1025774ce411f2 Christoph Hellwig  2010-06-04  5465  	/*
1025774ce411f2 Christoph Hellwig  2010-06-04  5466  	 * If the call to ext4=
_truncate failed to get a transaction handle at
1025774ce411f2 Christoph Hellwig  2010-06-04  5467  	 * all, we need to cle=
an up the in-core orphan list manually.
1025774ce411f2 Christoph Hellwig  2010-06-04  5468  	 */
3d287de3b82822 Dmitry Monakhov    2010-10-27  5469  	if (orphan && inode->i=
_nlink)
617ba13b31fbf5 Mingming Cao       2006-10-11  5470  		ext4_orphan_del(NULL,=
 inode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5471  =

2c98eb5ea24976 Theodore Ts'o      2016-11-13  5472  	if (!error && (ia_vali=
d & ATTR_MODE))
64e178a7118b1c Christoph Hellwig  2013-12-20  5473  		rc =3D posix_acl_chmo=
d(inode, inode->i_mode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5474  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  5475  err_out:
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5476  	if  (error)
617ba13b31fbf5 Mingming Cao       2006-10-11 @5477  		ext4_std_error(inode-=
>i_sb, error);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5478  	if (!error)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5479  		error =3D rc;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  5480  	ext4_fc_stop_update(in=
ode);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5481  	return error;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5482  }
ac27a0ec112a08 Dave Kleikamp      2006-10-11  5483  =


:::::: The code at line 5477 was first introduced by commit
:::::: 617ba13b31fbf505cc21799826639ef24ed94af0 [PATCH] ext4: rename ext4 s=
ymbols to avoid duplication of ext3 symbols

:::::: TO: Mingming Cao <cmm@us.ibm.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5511288846913306636==--

