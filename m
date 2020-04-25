Content-Type: multipart/mixed; boundary="===============4675501251347566669=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [dm:for-next 29/30] drivers/md/dm-ebs-target.c:190:32: sparse: expected restricted blk_status_t [usertype] bi_status
Date: Sun, 26 Apr 2020 06:09:35 +0800
Message-ID: <202004260633.GfuVIi5h%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4675501251347566669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: dm-devel(a)redhat.com
TO: Heinz Mauelshagen <heinzm@redhat.com>
CC: Mike Snitzer <snitzer@redhat.com>
CC: Damien Le Moal <DamienLeMoal@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux=
-dm.git for-next
head:   ddc1316e185f6ab4a74656b4879a15ec23cdec31
commit: eeb17d25430dc2b3251a5abfec6a3b9160daaef6 [29/30] dm ebs: new block =
size emulating target
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout eeb17d25430dc2b3251a5abfec6a3b9160daaef6
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 7 hours ago
:::::: commit date: 30 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/md/dm-ebs-target.c:190:32: sparse: sparse: incorrect type in ass=
ignment (different base types) @@    expected restricted blk_status_t [user=
type] bi_status @@    got s_t [usertype] bi_status @@
>> drivers/md/dm-ebs-target.c:190:32: sparse:    expected restricted blk_st=
atus_t [usertype] bi_status
>> drivers/md/dm-ebs-target.c:190:32: sparse:    got int [assigned] r
   drivers/md/dm-ebs-target.c:423:12: sparse: sparse: symbol 'dm_ebs_init' =
was not declared. Should it be static?
   drivers/md/dm-ebs-target.c:433:6: sparse: sparse: symbol 'dm_ebs_exit' w=
as not declared. Should it be static?

# https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.gi=
t/commit/?id=3Deeb17d25430dc2b3251a5abfec6a3b9160daaef6
git remote add dm https://git.kernel.org/pub/scm/linux/kernel/git/device-ma=
pper/linux-dm.git
git remote update dm
git checkout eeb17d25430dc2b3251a5abfec6a3b9160daaef6
vim +190 drivers/md/dm-ebs-target.c

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  146  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  147  /* Worker funtion to proc=
ess incoming bios. */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  148  static void __ebs_process=
_bios(struct work_struct *ws)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  149  {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  150  	int r;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  151  	bool write =3D false;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  152  	sector_t block1, block2;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  153  	struct ebs_c *ec =3D con=
tainer_of(ws, struct ebs_c, ws);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  154  	struct bio *bio;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  155  	struct bio_list bios;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  156  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  157  	bio_list_init(&bios);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  158  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  159  	spin_lock_irq(&ec->lock);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  160  	bios =3D ec->bios_in;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  161  	bio_list_init(&ec->bios_=
in);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  162  	spin_unlock_irq(&ec->loc=
k);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  163  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  164  	/* Prefetch all read and=
 any mis-aligned write buffers */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  165  	bio_list_for_each(bio, &=
bios) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  166  		block1 =3D __sector_to_=
block(ec, bio->bi_iter.bi_sector);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  167  		if (bio_op(bio) =3D=3D =
REQ_OP_READ)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  168  			dm_bufio_prefetch(ec->=
bufio, block1, __nr_blocks(ec, bio));
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  169  		else if (bio_op(bio) =
=3D=3D REQ_OP_WRITE && !(bio->bi_opf & REQ_PREFLUSH)) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  170  			block2 =3D __sector_to=
_block(ec, bio_end_sector(bio));
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  171  			if (__block_mod(bio->b=
i_iter.bi_sector, ec->u_bs))
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  172  				dm_bufio_prefetch(ec-=
>bufio, block1, 1);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  173  			if (__block_mod(bio_en=
d_sector(bio), ec->u_bs) && block2 !=3D block1)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  174  				dm_bufio_prefetch(ec-=
>bufio, block2, 1);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  175  		}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  176  	}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  177  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  178  	bio_list_for_each(bio, &=
bios) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  179  		r =3D -EIO;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  180  		if (bio_op(bio) =3D=3D =
REQ_OP_READ)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  181  			r =3D __ebs_rw_bio(ec,=
 READ, bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  182  		else if (bio_op(bio) =
=3D=3D REQ_OP_WRITE) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  183  			write =3D true;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  184  			r =3D __ebs_rw_bio(ec,=
 WRITE, bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  185  		} else if (bio_op(bio) =
=3D=3D REQ_OP_DISCARD) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  186  			/* FIXME: (optionally)=
 call dm_bufio_discard_buffers() once upstream. */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  187  			r =3D __ebs_forget_bio=
(ec, bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  188  		}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  189  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09 @190  		bio->bi_status =3D r;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  191  	}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  192  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  193  	/*
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  194  	 * We write dirty buffer=
s after processing I/O on them
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  195  	 * but before we endio t=
hus addressing REQ_FUA/REQ_SYNC.
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  196  	 */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  197  	r =3D write ? dm_bufio_w=
rite_dirty_buffers(ec->bufio) : 0;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  198  =

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  199  	while ((bio =3D bio_list=
_pop(&bios))) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  200  		/* Any other request is=
 endioed. */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  201  		if (unlikely(r && bio_o=
p(bio) =3D=3D REQ_OP_WRITE))
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  202  			bio_io_error(bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  203  		else
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  204  			bio_endio(bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  205  	}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  206  }
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  207  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4675501251347566669==--

