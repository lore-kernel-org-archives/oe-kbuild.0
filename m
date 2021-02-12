Content-Type: multipart/mixed; boundary="===============6602744300290174568=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [block:dio-mem-align 1/3] fs/direct-io.c:1177 do_blockdev_direct_IO() warn: variable dereferenced before check 'bdev' (see line 1132)
Date: Fri, 12 Feb 2021 17:40:53 +0800
Message-ID: <202102121747.FzfSo8rV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6602744300290174568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it dio-mem-align
head:   3d6ef82805958611e8ffa0a901c014b6f066c3e6
commit: 446db6bc49cd5c4a77daffbbcbe0cf69ff7a62e0 [1/3] fs: relax memory ali=
gnment restriction for O_DIRECT
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20210211 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/direct-io.c:1177 do_blockdev_direct_IO() warn: variable dereferenced bef=
ore check 'bdev' (see line 1132)

vim +/bdev +1177 fs/direct-io.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1099  =

eafdc7d190a944 Christoph Hellwig       2010-06-04  1100  /*
eafdc7d190a944 Christoph Hellwig       2010-06-04  1101   * This is a libra=
ry function for use by filesystem drivers.
eafdc7d190a944 Christoph Hellwig       2010-06-04  1102   *
eafdc7d190a944 Christoph Hellwig       2010-06-04  1103   * The locking rul=
es are governed by the flags parameter:
eafdc7d190a944 Christoph Hellwig       2010-06-04  1104   *  - if the flags=
 value contains DIO_LOCKING we use a fancy locking
eafdc7d190a944 Christoph Hellwig       2010-06-04  1105   *    scheme for d=
umb filesystems.
eafdc7d190a944 Christoph Hellwig       2010-06-04  1106   *    For writes t=
his function is called under i_mutex and returns with
eafdc7d190a944 Christoph Hellwig       2010-06-04  1107   *    i_mutex held=
, for reads, i_mutex is not held on entry, but it is
eafdc7d190a944 Christoph Hellwig       2010-06-04  1108   *    taken and dr=
opped again before returning.
eafdc7d190a944 Christoph Hellwig       2010-06-04  1109   *  - if the flags=
 value does NOT contain DIO_LOCKING we don't use any
eafdc7d190a944 Christoph Hellwig       2010-06-04  1110   *    internal loc=
king but rather rely on the filesystem to synchronize
eafdc7d190a944 Christoph Hellwig       2010-06-04  1111   *    direct I/O r=
eads/writes versus each other and truncate.
df2d6f26586f12 Christoph Hellwig       2011-06-24  1112   *
df2d6f26586f12 Christoph Hellwig       2011-06-24  1113   * To help with lo=
cking against truncate we incremented the i_dio_count
df2d6f26586f12 Christoph Hellwig       2011-06-24  1114   * counter before =
starting direct I/O, and decrement it once we are done.
df2d6f26586f12 Christoph Hellwig       2011-06-24  1115   * Truncate can wa=
it for it to reach zero to provide exclusion.  It is
df2d6f26586f12 Christoph Hellwig       2011-06-24  1116   * expected that f=
ilesystem provide exclusion between new direct I/O
df2d6f26586f12 Christoph Hellwig       2011-06-24  1117   * and truncates. =
 For DIO_LOCKING filesystems this is done by i_mutex,
df2d6f26586f12 Christoph Hellwig       2011-06-24  1118   * but other files=
ystems need to take care of this on their own.
ba253fbf6d3502 Andi Kleen              2011-08-01  1119   *
ba253fbf6d3502 Andi Kleen              2011-08-01  1120   * NOTE: if you pa=
ss "sdio" to anything by pointer make sure that function
ba253fbf6d3502 Andi Kleen              2011-08-01  1121   * is always inlin=
ed. Otherwise gcc is unable to split the structure into
ba253fbf6d3502 Andi Kleen              2011-08-01  1122   * individual fiel=
ds and will generate much worse code. This is important
ba253fbf6d3502 Andi Kleen              2011-08-01  1123   * for the whole f=
ile.
eafdc7d190a944 Christoph Hellwig       2010-06-04  1124   */
65dd2aa90aa17a Andi Kleen              2012-01-12  1125  static inline ssiz=
e_t
17f8c842d24ac0 Omar Sandoval           2015-03-16  1126  do_blockdev_direct=
_IO(struct kiocb *iocb, struct inode *inode,
17f8c842d24ac0 Omar Sandoval           2015-03-16  1127  		      struct blo=
ck_device *bdev, struct iov_iter *iter,
c8b8e32d700fe9 Christoph Hellwig       2016-04-07  1128  		      get_block_=
t get_block, dio_iodone_t end_io,
facd07b07d2a79 Josef Bacik             2010-05-23  1129  		      dio_submit=
_t submit_io, int flags)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1130  {
6aa7de059173a9 Mark Rutland            2017-10-23  1131  	unsigned i_blkbit=
s =3D READ_ONCE(inode->i_blkbits);
446db6bc49cd5c Jens Axboe              2021-02-11 @1132  	struct request_qu=
eue *q =3D bdev_get_queue(bdev);
ab73857e354ab9 Linus Torvalds          2012-11-29  1133  	unsigned blkbits =
=3D i_blkbits;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1134  	unsigned blocksiz=
e_mask =3D (1 << blkbits) - 1;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1135  	ssize_t retval =
=3D -EINVAL;
1c0ff0f1bdeb18 Nikolay Borisov         2018-04-05  1136  	const size_t coun=
t =3D iov_iter_count(iter);
c8b8e32d700fe9 Christoph Hellwig       2016-04-07  1137  	loff_t offset =3D=
 iocb->ki_pos;
1c0ff0f1bdeb18 Nikolay Borisov         2018-04-05  1138  	const loff_t end =
=3D offset + count;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1139  	struct dio *dio;
eb28be2b4c0a06 Andi Kleen              2011-08-01  1140  	struct dio_submit=
 sdio =3D { 0, };
847cc6371ba820 Andi Kleen              2011-08-01  1141  	struct buffer_hea=
d map_bh =3D { 0, };
647d1e4c523576 Fengguang Wu            2012-08-09  1142  	struct blk_plug p=
lug;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1143  =

65dd2aa90aa17a Andi Kleen              2012-01-12  1144  	/*
65dd2aa90aa17a Andi Kleen              2012-01-12  1145  	 * Avoid referenc=
es to bdev if not absolutely needed to give
65dd2aa90aa17a Andi Kleen              2012-01-12  1146  	 * the early pref=
etch in the caller enough time.
65dd2aa90aa17a Andi Kleen              2012-01-12  1147  	 */
^1da177e4c3f41 Linus Torvalds          2005-04-16  1148  =

f9b5570d7fdedf Christoph Hellwig       2011-06-24  1149  	/* watch out for =
a 0 len io from a tricksy fs */
1c0ff0f1bdeb18 Nikolay Borisov         2018-04-05  1150  	if (iov_iter_rw(i=
ter) =3D=3D READ && !count)
f9b5570d7fdedf Christoph Hellwig       2011-06-24  1151  		return 0;
f9b5570d7fdedf Christoph Hellwig       2011-06-24  1152  =

6e8267f532a171 Andi Kleen              2011-08-01  1153  	dio =3D kmem_cach=
e_alloc(dio_cache, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1154  	if (!dio)
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1155  		return -ENOMEM;
23aee091d804ef Jeff Moyer              2009-12-15  1156  	/*
23aee091d804ef Jeff Moyer              2009-12-15  1157  	 * Believe it or =
not, zeroing out the page array caused a .5%
23aee091d804ef Jeff Moyer              2009-12-15  1158  	 * performance re=
gression in a database benchmark.  So, we take
23aee091d804ef Jeff Moyer              2009-12-15  1159  	 * care to only z=
ero out what's needed.
23aee091d804ef Jeff Moyer              2009-12-15  1160  	 */
23aee091d804ef Jeff Moyer              2009-12-15  1161  	memset(dio, 0, of=
fsetof(struct dio, pages));
^1da177e4c3f41 Linus Torvalds          2005-04-16  1162  =

5fe878ae7f82fb Christoph Hellwig       2009-12-15  1163  	dio->flags =3D fl=
ags;
0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1164  	if (dio->flags & =
DIO_LOCKING && iov_iter_rw(iter) =3D=3D READ) {
5fe878ae7f82fb Christoph Hellwig       2009-12-15  1165  		/* will be relea=
sed by direct_io_worker */
5955102c9984fa Al Viro                 2016-01-22  1166  		inode_lock(inode=
);
df2d6f26586f12 Christoph Hellwig       2011-06-24  1167  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1168  =

74cedf9b6c603f Jan Kara                2015-11-30  1169  	/* Once we sample=
d i_size check for reads beyond EOF */
74cedf9b6c603f Jan Kara                2015-11-30  1170  	dio->i_size =3D i=
_size_read(inode);
74cedf9b6c603f Jan Kara                2015-11-30  1171  	if (iov_iter_rw(i=
ter) =3D=3D READ && offset >=3D dio->i_size) {
2d4594acbf6d8f Al Viro                 2015-12-08  1172  		retval =3D 0;
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1173  		goto fail_dio;
74cedf9b6c603f Jan Kara                2015-11-30  1174  	}
74cedf9b6c603f Jan Kara                2015-11-30  1175  =

446db6bc49cd5c Jens Axboe              2021-02-11  1176  	if (offset & bloc=
ksize_mask) {
41b21af388f94b Gabriel Krisman Bertazi 2020-10-08 @1177  		if (bdev)
41b21af388f94b Gabriel Krisman Bertazi 2020-10-08  1178  			blkbits =3D blk=
size_bits(bdev_logical_block_size(bdev));
41b21af388f94b Gabriel Krisman Bertazi 2020-10-08  1179  		blocksize_mask =
=3D (1 << blkbits) - 1;
446db6bc49cd5c Jens Axboe              2021-02-11  1180  		if (offset & blo=
cksize_mask)
41b21af388f94b Gabriel Krisman Bertazi 2020-10-08  1181  			goto fail_dio;
41b21af388f94b Gabriel Krisman Bertazi 2020-10-08  1182  	}
446db6bc49cd5c Jens Axboe              2021-02-11  1183  	if (iov_iter_alig=
nment(iter) & (unsigned long) q->dma_alignment)
446db6bc49cd5c Jens Axboe              2021-02-11  1184  		goto fail_dio;
41b21af388f94b Gabriel Krisman Bertazi 2020-10-08  1185  =

0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1186  	if (dio->flags & =
DIO_LOCKING && iov_iter_rw(iter) =3D=3D READ) {
0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1187  		struct address_s=
pace *mapping =3D iocb->ki_filp->f_mapping;
0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1188  =

0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1189  		retval =3D filem=
ap_write_and_wait_range(mapping, offset, end - 1);
0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1190  		if (retval)
0a9164cb7ff32d Gabriel Krisman Bertazi 2020-10-08  1191  			goto fail_dio;
74cedf9b6c603f Jan Kara                2015-11-30  1192  	}
74cedf9b6c603f Jan Kara                2015-11-30  1193  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  1194  	/*
6039257378e4c8 Christoph Hellwig       2014-02-10  1195  	 * For file exten=
ding writes updating i_size before data writeouts
6039257378e4c8 Christoph Hellwig       2014-02-10  1196  	 * complete can e=
xpose uninitialized blocks in dumb filesystems.
6039257378e4c8 Christoph Hellwig       2014-02-10  1197  	 * In that case w=
e need to wait for I/O completion even if asked
6039257378e4c8 Christoph Hellwig       2014-02-10  1198  	 * for an asynchr=
onous write.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1199  	 */
6039257378e4c8 Christoph Hellwig       2014-02-10  1200  	if (is_sync_kiocb=
(iocb))
6039257378e4c8 Christoph Hellwig       2014-02-10  1201  		dio->is_async =
=3D false;
c8f4c36f816230 Nikolay Borisov         2018-02-23  1202  	else if (iov_iter=
_rw(iter) =3D=3D WRITE && end > i_size_read(inode))
6039257378e4c8 Christoph Hellwig       2014-02-10  1203  		dio->is_async =
=3D false;
6039257378e4c8 Christoph Hellwig       2014-02-10  1204  	else
6039257378e4c8 Christoph Hellwig       2014-02-10  1205  		dio->is_async =
=3D true;
6039257378e4c8 Christoph Hellwig       2014-02-10  1206  =

847cc6371ba820 Andi Kleen              2011-08-01  1207  	dio->inode =3D in=
ode;
8a4c1e42e0eb71 Mike Christie           2016-06-05  1208  	if (iov_iter_rw(i=
ter) =3D=3D WRITE) {
8a4c1e42e0eb71 Mike Christie           2016-06-05  1209  		dio->op =3D REQ_=
OP_WRITE;
70fd76140a6cb6 Christoph Hellwig       2016-11-01  1210  		dio->op_flags =
=3D REQ_SYNC | REQ_IDLE;
03a07c92a9ed99 Goldwyn Rodrigues       2017-06-20  1211  		if (iocb->ki_fla=
gs & IOCB_NOWAIT)
03a07c92a9ed99 Goldwyn Rodrigues       2017-06-20  1212  			dio->op_flags |=
=3D REQ_NOWAIT;
8a4c1e42e0eb71 Mike Christie           2016-06-05  1213  	} else {
8a4c1e42e0eb71 Mike Christie           2016-06-05  1214  		dio->op =3D REQ_=
OP_READ;
8a4c1e42e0eb71 Mike Christie           2016-06-05  1215  	}
d1e36282b0bbd5 Jens Axboe              2018-08-29  1216  	if (iocb->ki_flag=
s & IOCB_HIPRI)
d1e36282b0bbd5 Jens Axboe              2018-08-29  1217  		dio->op_flags |=
=3D REQ_HIPRI;
02afc27faec94c Christoph Hellwig       2013-09-04  1218  =

02afc27faec94c Christoph Hellwig       2013-09-04  1219  	/*
02afc27faec94c Christoph Hellwig       2013-09-04  1220  	 * For AIO O_(D)S=
YNC writes we need to defer completions to a workqueue
02afc27faec94c Christoph Hellwig       2013-09-04  1221  	 * so that we can=
 call ->fsync.
02afc27faec94c Christoph Hellwig       2013-09-04  1222  	 */
332391a9935da9 Lukas Czerner           2017-09-21  1223  	if (dio->is_async=
 && iov_iter_rw(iter) =3D=3D WRITE) {
332391a9935da9 Lukas Czerner           2017-09-21  1224  		retval =3D 0;
d9c10e5b8863cf Jan Kara                2018-02-26  1225  		if (iocb->ki_fla=
gs & IOCB_DSYNC)
02afc27faec94c Christoph Hellwig       2013-09-04  1226  			retval =3D dio_=
set_defer_completion(dio);
332391a9935da9 Lukas Czerner           2017-09-21  1227  		else if (!dio->i=
node->i_sb->s_dio_done_wq) {
332391a9935da9 Lukas Czerner           2017-09-21  1228  			/*
332391a9935da9 Lukas Czerner           2017-09-21  1229  			 * In case of A=
IO write racing with buffered read we
332391a9935da9 Lukas Czerner           2017-09-21  1230  			 * need to defe=
r completion. We can't decide this now,
332391a9935da9 Lukas Czerner           2017-09-21  1231  			 * however the =
workqueue needs to be initialized here.
332391a9935da9 Lukas Czerner           2017-09-21  1232  			 */
332391a9935da9 Lukas Czerner           2017-09-21  1233  			retval =3D sb_i=
nit_dio_done_wq(dio->inode->i_sb);
332391a9935da9 Lukas Czerner           2017-09-21  1234  		}
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1235  		if (retval)
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1236  			goto fail_dio;
02afc27faec94c Christoph Hellwig       2013-09-04  1237  	}
02afc27faec94c Christoph Hellwig       2013-09-04  1238  =

02afc27faec94c Christoph Hellwig       2013-09-04  1239  	/*
02afc27faec94c Christoph Hellwig       2013-09-04  1240  	 * Will be decrem=
ented at I/O completion time.
02afc27faec94c Christoph Hellwig       2013-09-04  1241  	 */
fe0f07d08ee35f Jens Axboe              2015-04-15  1242  	inode_dio_begin(i=
node);
02afc27faec94c Christoph Hellwig       2013-09-04  1243  =

02afc27faec94c Christoph Hellwig       2013-09-04  1244  	retval =3D 0;
847cc6371ba820 Andi Kleen              2011-08-01  1245  	sdio.blkbits =3D =
blkbits;
ab73857e354ab9 Linus Torvalds          2012-11-29  1246  	sdio.blkfactor =
=3D i_blkbits - blkbits;
847cc6371ba820 Andi Kleen              2011-08-01  1247  	sdio.block_in_fil=
e =3D offset >> blkbits;
847cc6371ba820 Andi Kleen              2011-08-01  1248  =

847cc6371ba820 Andi Kleen              2011-08-01  1249  	sdio.get_block =
=3D get_block;
847cc6371ba820 Andi Kleen              2011-08-01  1250  	dio->end_io =3D e=
nd_io;
847cc6371ba820 Andi Kleen              2011-08-01  1251  	sdio.submit_io =
=3D submit_io;
847cc6371ba820 Andi Kleen              2011-08-01  1252  	sdio.final_block_=
in_bio =3D -1;
847cc6371ba820 Andi Kleen              2011-08-01  1253  	sdio.next_block_f=
or_io =3D -1;
847cc6371ba820 Andi Kleen              2011-08-01  1254  =

847cc6371ba820 Andi Kleen              2011-08-01  1255  	dio->iocb =3D ioc=
b;
847cc6371ba820 Andi Kleen              2011-08-01  1256  =

847cc6371ba820 Andi Kleen              2011-08-01  1257  	spin_lock_init(&d=
io->bio_lock);
847cc6371ba820 Andi Kleen              2011-08-01  1258  	dio->refcount =3D=
 1;
847cc6371ba820 Andi Kleen              2011-08-01  1259  =

00e23707442a75 David Howells           2018-10-22  1260  	dio->should_dirty=
 =3D iter_is_iovec(iter) && iov_iter_rw(iter) =3D=3D READ;
7b2c99d15559e2 Al Viro                 2014-03-15  1261  	sdio.iter =3D ite=
r;
1c0ff0f1bdeb18 Nikolay Borisov         2018-04-05  1262  	sdio.final_block_=
in_request =3D end >> blkbits;
7b2c99d15559e2 Al Viro                 2014-03-15  1263  =

847cc6371ba820 Andi Kleen              2011-08-01  1264  	/*
847cc6371ba820 Andi Kleen              2011-08-01  1265  	 * In case of non=
-aligned buffers, we may need 2 more
847cc6371ba820 Andi Kleen              2011-08-01  1266  	 * pages since we=
 need to zero out first and last block.
847cc6371ba820 Andi Kleen              2011-08-01  1267  	 */
847cc6371ba820 Andi Kleen              2011-08-01  1268  	if (unlikely(sdio=
.blkfactor))
847cc6371ba820 Andi Kleen              2011-08-01  1269  		sdio.pages_in_io=
 =3D 2;
847cc6371ba820 Andi Kleen              2011-08-01  1270  =

f67da30c1d5fc9 Al Viro                 2014-03-19  1271  	sdio.pages_in_io =
+=3D iov_iter_npages(iter, INT_MAX);
847cc6371ba820 Andi Kleen              2011-08-01  1272  =

647d1e4c523576 Fengguang Wu            2012-08-09  1273  	blk_start_plug(&p=
lug);
647d1e4c523576 Fengguang Wu            2012-08-09  1274  =

847cc6371ba820 Andi Kleen              2011-08-01  1275  	retval =3D do_dir=
ect_IO(dio, &sdio, &map_bh);
7b2c99d15559e2 Al Viro                 2014-03-15  1276  	if (retval)
847cc6371ba820 Andi Kleen              2011-08-01  1277  		dio_cleanup(dio,=
 &sdio);
847cc6371ba820 Andi Kleen              2011-08-01  1278  =

847cc6371ba820 Andi Kleen              2011-08-01  1279  	if (retval =3D=3D=
 -ENOTBLK) {
847cc6371ba820 Andi Kleen              2011-08-01  1280  		/*
847cc6371ba820 Andi Kleen              2011-08-01  1281  		 * The remaining=
 part of the request will be
847cc6371ba820 Andi Kleen              2011-08-01  1282  		 * be handled by=
 buffered I/O when we return
847cc6371ba820 Andi Kleen              2011-08-01  1283  		 */
847cc6371ba820 Andi Kleen              2011-08-01  1284  		retval =3D 0;
847cc6371ba820 Andi Kleen              2011-08-01  1285  	}
847cc6371ba820 Andi Kleen              2011-08-01  1286  	/*
847cc6371ba820 Andi Kleen              2011-08-01  1287  	 * There may be s=
ome unwritten disk at the end of a part-written
847cc6371ba820 Andi Kleen              2011-08-01  1288  	 * fs-block-sized=
 block.  Go zero that now.
847cc6371ba820 Andi Kleen              2011-08-01  1289  	 */
847cc6371ba820 Andi Kleen              2011-08-01  1290  	dio_zero_block(di=
o, &sdio, 1, &map_bh);
847cc6371ba820 Andi Kleen              2011-08-01  1291  =

847cc6371ba820 Andi Kleen              2011-08-01  1292  	if (sdio.cur_page=
) {
847cc6371ba820 Andi Kleen              2011-08-01  1293  		ssize_t ret2;
847cc6371ba820 Andi Kleen              2011-08-01  1294  =

847cc6371ba820 Andi Kleen              2011-08-01  1295  		ret2 =3D dio_sen=
d_cur_page(dio, &sdio, &map_bh);
847cc6371ba820 Andi Kleen              2011-08-01  1296  		if (retval =3D=
=3D 0)
847cc6371ba820 Andi Kleen              2011-08-01  1297  			retval =3D ret2;
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  1298  		put_page(sdio.cu=
r_page);
847cc6371ba820 Andi Kleen              2011-08-01  1299  		sdio.cur_page =
=3D NULL;
847cc6371ba820 Andi Kleen              2011-08-01  1300  	}
847cc6371ba820 Andi Kleen              2011-08-01  1301  	if (sdio.bio)
847cc6371ba820 Andi Kleen              2011-08-01  1302  		dio_bio_submit(d=
io, &sdio);
847cc6371ba820 Andi Kleen              2011-08-01  1303  =

647d1e4c523576 Fengguang Wu            2012-08-09  1304  	blk_finish_plug(&=
plug);
647d1e4c523576 Fengguang Wu            2012-08-09  1305  =

847cc6371ba820 Andi Kleen              2011-08-01  1306  	/*
847cc6371ba820 Andi Kleen              2011-08-01  1307  	 * It is possible=
 that, we return short IO due to end of file.
847cc6371ba820 Andi Kleen              2011-08-01  1308  	 * In that case, =
we need to release all the pages we got hold on.
847cc6371ba820 Andi Kleen              2011-08-01  1309  	 */
847cc6371ba820 Andi Kleen              2011-08-01  1310  	dio_cleanup(dio, =
&sdio);
847cc6371ba820 Andi Kleen              2011-08-01  1311  =

847cc6371ba820 Andi Kleen              2011-08-01  1312  	/*
847cc6371ba820 Andi Kleen              2011-08-01  1313  	 * All block look=
ups have been performed. For READ requests
847cc6371ba820 Andi Kleen              2011-08-01  1314  	 * we can let i_m=
utex go now that its achieved its purpose
847cc6371ba820 Andi Kleen              2011-08-01  1315  	 * of protecting =
us from looking up uninitialized blocks.
847cc6371ba820 Andi Kleen              2011-08-01  1316  	 */
17f8c842d24ac0 Omar Sandoval           2015-03-16  1317  	if (iov_iter_rw(i=
ter) =3D=3D READ && (dio->flags & DIO_LOCKING))
5955102c9984fa Al Viro                 2016-01-22  1318  		inode_unlock(dio=
->inode);
847cc6371ba820 Andi Kleen              2011-08-01  1319  =

847cc6371ba820 Andi Kleen              2011-08-01  1320  	/*
847cc6371ba820 Andi Kleen              2011-08-01  1321  	 * The only time =
we want to leave bios in flight is when a successful
847cc6371ba820 Andi Kleen              2011-08-01  1322  	 * partial aio re=
ad or full aio write have been setup.  In that case
847cc6371ba820 Andi Kleen              2011-08-01  1323  	 * bio completion=
 will call aio_complete.  The only time it's safe to
847cc6371ba820 Andi Kleen              2011-08-01  1324  	 * call aio_compl=
ete is when we return -EIOCBQUEUED, so we key on that.
847cc6371ba820 Andi Kleen              2011-08-01  1325  	 * This had *bett=
er* be the only place that raises -EIOCBQUEUED.
847cc6371ba820 Andi Kleen              2011-08-01  1326  	 */
847cc6371ba820 Andi Kleen              2011-08-01  1327  	BUG_ON(retval =3D=
=3D -EIOCBQUEUED);
847cc6371ba820 Andi Kleen              2011-08-01  1328  	if (dio->is_async=
 && retval =3D=3D 0 && dio->result &&
17f8c842d24ac0 Omar Sandoval           2015-03-16  1329  	    (iov_iter_rw(=
iter) =3D=3D READ || dio->result =3D=3D count))
847cc6371ba820 Andi Kleen              2011-08-01  1330  		retval =3D -EIOC=
BQUEUED;
af436472772d47 Christoph Hellwig       2014-07-30  1331  	else
847cc6371ba820 Andi Kleen              2011-08-01  1332  		dio_await_comple=
tion(dio);
847cc6371ba820 Andi Kleen              2011-08-01  1333  =

847cc6371ba820 Andi Kleen              2011-08-01  1334  	if (drop_refcount=
(dio) =3D=3D 0) {
ffe51f0142a291 Lukas Czerner           2017-10-17  1335  		retval =3D dio_c=
omplete(dio, retval, DIO_COMPLETE_INVALIDATE);
847cc6371ba820 Andi Kleen              2011-08-01  1336  	} else
847cc6371ba820 Andi Kleen              2011-08-01  1337  		BUG_ON(retval !=
=3D -EIOCBQUEUED);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1338  =

46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1339  	return retval;
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1340  =

46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1341  fail_dio:
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1342  	if (dio->flags & =
DIO_LOCKING && iov_iter_rw(iter) =3D=3D READ)
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1343  		inode_unlock(ino=
de);
46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1344  =

46d716025a228d Gabriel Krisman Bertazi 2020-10-08  1345  	kmem_cache_free(d=
io_cache, dio);
7bb46a6734a7e1 npiggin(a)suse.de         2010-05-27  1346  	return retval;
7bb46a6734a7e1 npiggin(a)suse.de         2010-05-27  1347  }
65dd2aa90aa17a Andi Kleen              2012-01-12  1348  =


:::::: The code at line 1177 was first introduced by commit
:::::: 41b21af388f94baf7433d4e7845703c7275251de direct-io: defer alignment =
check until after the EOF check

:::::: TO: Gabriel Krisman Bertazi <krisman@collabora.com>
:::::: CC: Jan Kara <jack@suse.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6602744300290174568==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6602744300290174568==--

