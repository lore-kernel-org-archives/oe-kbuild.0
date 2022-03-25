Content-Type: multipart/mixed; boundary="===============3111800235429923678=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] md/bitmap: don't set sb values if can't pass sanity check
Date: Sat, 26 Mar 2022 06:55:26 +0800
Message-ID: <202203260647.ZIDU6VYv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3111800235429923678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220325025223.1866-1-heming.zhao@suse.com>
References: <20220325025223.1866-1-heming.zhao@suse.com>
TO: Heming Zhao <heming.zhao@suse.com>
TO: linux-raid(a)vger.kernel.org
TO: song(a)kernel.org
CC: Heming Zhao <heming.zhao@suse.com>
CC: guoqing.jiang(a)linux.dev
CC: xni(a)redhat.com

Hi Heming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on song-md/md-next]
[also build test WARNING on v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Heming-Zhao/md-bitmap-don-=
t-set-sb-values-if-can-t-pass-sanity-check/20220325-105426
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc-randconfig-m031-20220324 (https://download.01.org/0day-ci/a=
rchive/20220326/202203260647.ZIDU6VYv-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/md/md-bitmap.c:644 md_bitmap_read_sb() error: uninitialized symbol =
'chunksize'.
drivers/md/md-bitmap.c:648 md_bitmap_read_sb() error: uninitialized symbol =
'daemon_sleep'.
drivers/md/md-bitmap.c:650 md_bitmap_read_sb() error: uninitialized symbol =
'write_behind'.

Old smatch warnings:
drivers/md/md-bitmap.c:371 read_page() warn: should 'index << (12 - inode->=
i_blkbits)' be a 64 bit type?
drivers/md/md-bitmap.c:2182 md_bitmap_resize() warn: should 'old_counts.chu=
nks << old_counts.chunkshift' be a 64 bit type?
drivers/md/md-bitmap.c:2206 md_bitmap_resize() warn: should '1 << chunkshif=
t' be a 64 bit type?

vim +/chunksize +644 drivers/md/md-bitmap.c

9c81075f436f86 drivers/md/bitmap.c    Jonathan Brassow  2011-06-08  576  =

32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  577  /*=
 read the superblock from the bitmap file and initialize some bitmap fields=
 */
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  578  st=
atic int md_bitmap_read_sb(struct bitmap *bitmap)
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  579  {
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  580  	c=
har *reason =3D NULL;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  581  	b=
itmap_super_t *sb;
4b6d287f627b5f drivers/md/bitmap.c    NeilBrown         2005-09-09  582  	u=
nsigned long chunksize, daemon_sleep, write_behind;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  583  	u=
nsigned long long events;
c4ce867fdad200 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-03-29  584  	i=
nt nodes =3D 0;
1dff2b87a34a1a drivers/md/bitmap.c    NeilBrown         2012-05-22  585  	u=
nsigned long sectors_reserved =3D 0;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  586  	i=
nt err =3D -EINVAL;
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  587  	s=
truct page *sb_page;
33e38ac6887d97 drivers/md/bitmap.c    Goldwyn Rodrigues 2015-07-01  588  	l=
off_t offset =3D bitmap->mddev->bitmap_info.offset;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  589  =

1ec885cdd01a9a drivers/md/bitmap.c    NeilBrown         2012-05-22  590  	i=
f (!bitmap->storage.file && !bitmap->mddev->bitmap_info.offset) {
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  591  		=
chunksize =3D 128 * 1024 * 1024;
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  592  		=
daemon_sleep =3D 5 * HZ;
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  593  		=
write_behind =3D 0;
b405fe91e50c60 drivers/md/bitmap.c    NeilBrown         2012-05-22  594  		=
set_bit(BITMAP_STALE, &bitmap->flags);
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  595  		=
err =3D 0;
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  596  		=
goto out_no_sb;
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  597  	}
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  598  	/=
* page 0 is the superblock, read it... */
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  599  	s=
b_page =3D alloc_page(GFP_KERNEL);
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  600  	i=
f (!sb_page)
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  601  		=
return -ENOMEM;
1ec885cdd01a9a drivers/md/bitmap.c    NeilBrown         2012-05-22  602  	b=
itmap->storage.sb_page =3D sb_page;
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  603  =

b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  604  re=
_read:
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  605  	/=
* If cluster_slot is set, the cluster is setup */
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  606  	i=
f (bitmap->cluster_slot >=3D 0) {
3b0e6aacbfe04f drivers/md/bitmap.c    Stephen Rothwell  2015-03-03  607  		=
sector_t bm_blocks =3D bitmap->mddev->resync_max_sectors;
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  608  =

a913096decbf41 drivers/md/md-bitmap.c Zhao Heming       2020-10-06  609  		=
bm_blocks =3D DIV_ROUND_UP_SECTOR_T(bm_blocks,
a913096decbf41 drivers/md/md-bitmap.c Zhao Heming       2020-10-06  610  		=
	   (bitmap->mddev->bitmap_info.chunksize >> 9));
124eb761edfdee drivers/md/bitmap.c    Goldwyn Rodrigues 2015-03-24  611  		=
/* bits to bytes */
124eb761edfdee drivers/md/bitmap.c    Goldwyn Rodrigues 2015-03-24  612  		=
bm_blocks =3D ((bm_blocks+7) >> 3) + sizeof(bitmap_super_t);
124eb761edfdee drivers/md/bitmap.c    Goldwyn Rodrigues 2015-03-24  613  		=
/* to 4k blocks */
935f3d4fc62c1f drivers/md/bitmap.c    NeilBrown         2015-03-02  614  		=
bm_blocks =3D DIV_ROUND_UP_SECTOR_T(bm_blocks, 4096);
33e38ac6887d97 drivers/md/bitmap.c    Goldwyn Rodrigues 2015-07-01  615  		=
offset =3D bitmap->mddev->bitmap_info.offset + (bitmap->cluster_slot * (bm_=
blocks << 3));
ec0cc226854a79 drivers/md/bitmap.c    NeilBrown         2016-11-02  616  		=
pr_debug("%s:%d bm slot: %d offset: %llu\n", __func__, __LINE__,
33e38ac6887d97 drivers/md/bitmap.c    Goldwyn Rodrigues 2015-07-01  617  		=
	bitmap->cluster_slot, offset);
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  618  	}
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  619  =

1ec885cdd01a9a drivers/md/bitmap.c    NeilBrown         2012-05-22  620  	i=
f (bitmap->storage.file) {
1ec885cdd01a9a drivers/md/bitmap.c    NeilBrown         2012-05-22  621  		=
loff_t isize =3D i_size_read(bitmap->storage.file->f_mapping->host);
f49d5e62d9352d drivers/md/bitmap.c    NeilBrown         2007-01-26  622  		=
int bytes =3D isize > PAGE_SIZE ? PAGE_SIZE : isize;
f49d5e62d9352d drivers/md/bitmap.c    NeilBrown         2007-01-26  623  =

1ec885cdd01a9a drivers/md/bitmap.c    NeilBrown         2012-05-22  624  		=
err =3D read_page(bitmap->storage.file, 0,
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  625  		=
		bitmap, bytes, sb_page);
f49d5e62d9352d drivers/md/bitmap.c    NeilBrown         2007-01-26  626  	}=
 else {
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  627  		=
err =3D read_sb_page(bitmap->mddev,
33e38ac6887d97 drivers/md/bitmap.c    Goldwyn Rodrigues 2015-07-01  628  		=
		   offset,
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  629  		=
		   sb_page,
938b533d479e74 drivers/md/bitmap.c    Shaohua Li        2017-10-16  630  		=
		   0, sizeof(bitmap_super_t));
a654b9d8f851f4 drivers/md/bitmap.c    NeilBrown         2005-06-21  631  	}
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  632  	i=
f (err)
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  633  		=
return err;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  634  =

b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  635  	e=
rr =3D -EINVAL;
27581e5ae01f77 drivers/md/bitmap.c    NeilBrown         2012-05-22  636  	s=
b =3D kmap_atomic(sb_page);
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  637  =

32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  638  	/=
* verify that the bitmap-specific fields are valid */
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  639  	i=
f (sb->magic !=3D cpu_to_le32(BITMAP_MAGIC))
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  640  		=
reason =3D "bad magic";
bd926c63b7a684 drivers/md/bitmap.c    NeilBrown         2005-11-08  641  	e=
lse if (le32_to_cpu(sb->version) < BITMAP_MAJOR_LO ||
3c462c880b52aa drivers/md/bitmap.c    Goldwyn Rodrigues 2015-08-19  642  		=
 le32_to_cpu(sb->version) > BITMAP_MAJOR_CLUSTERED)
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  643  		=
reason =3D "unrecognized superblock version";
1187cf0a3c8b64 drivers/md/bitmap.c    NeilBrown         2009-03-31 @644  	e=
lse if (chunksize < 512)
7dd5d34c6c2da0 drivers/md/bitmap.c    NeilBrown         2006-01-06  645  		=
reason =3D "bitmap chunksize too small";
d744540cd39e93 drivers/md/bitmap.c    Jonathan Brassow  2011-06-08  646  	e=
lse if (!is_power_of_2(chunksize))
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  647  		=
reason =3D "bitmap chunksize not a power of 2";
1b04be96f6910e drivers/md/bitmap.c    NeilBrown         2009-12-14 @648  	e=
lse if (daemon_sleep < 1 || daemon_sleep > MAX_SCHEDULE_TIMEOUT)
7dd5d34c6c2da0 drivers/md/bitmap.c    NeilBrown         2006-01-06  649  		=
reason =3D "daemon sleep period out of range";
4b6d287f627b5f drivers/md/bitmap.c    NeilBrown         2005-09-09 @650  	e=
lse if (write_behind > COUNTER_MAX)
4b6d287f627b5f drivers/md/bitmap.c    NeilBrown         2005-09-09  651  		=
reason =3D "write-behind limit out of range (0 - 16383)";
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  652  	i=
f (reason) {
ec0cc226854a79 drivers/md/bitmap.c    NeilBrown         2016-11-02  653  		=
pr_warn("%s: invalid bitmap file superblock: %s\n",
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  654  		=
	bmname(bitmap), reason);
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  655  		=
goto out;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  656  	}
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  657  =

f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  658  	c=
hunksize =3D le32_to_cpu(sb->chunksize);
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  659  	d=
aemon_sleep =3D le32_to_cpu(sb->daemon_sleep) * HZ;
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  660  	w=
rite_behind =3D le32_to_cpu(sb->write_behind);
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  661  	s=
ectors_reserved =3D le32_to_cpu(sb->sectors_reserved);
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  662  	/=
* Setup nodes/clustername only if bitmap version is
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  663  	 =
* cluster-compatible
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  664  	 =
*/
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  665  	i=
f (sb->version =3D=3D cpu_to_le32(BITMAP_MAJOR_CLUSTERED)) {
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  666  		=
nodes =3D le32_to_cpu(sb->nodes);
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  667  		=
strlcpy(bitmap->mddev->bitmap_info.cluster_name,
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  668  		=
		sb->cluster_name, 64);
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  669  	}
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  670  =

32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  671  	/=
* keep the array size field of the bitmap superblock up to date */
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  672  	s=
b->sync_size =3D cpu_to_le64(bitmap->mddev->resync_max_sectors);
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  673  =

278c1ca2f254d0 drivers/md/bitmap.c    NeilBrown         2012-03-19  674  	i=
f (bitmap->mddev->persistent) {
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  675  		=
/*
278c1ca2f254d0 drivers/md/bitmap.c    NeilBrown         2012-03-19  676  		=
 * We have a persistent array superblock, so compare the
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  677  		=
 * bitmap's UUID and event counter to the mddev's
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  678  		=
 */
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  679  		=
if (memcmp(sb->uuid, bitmap->mddev->uuid, 16)) {
ec0cc226854a79 drivers/md/bitmap.c    NeilBrown         2016-11-02  680  		=
	pr_warn("%s: bitmap superblock UUID mismatch\n",
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  681  		=
		bmname(bitmap));
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  682  		=
	goto out;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  683  		}
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  684  		=
events =3D le64_to_cpu(sb->events);
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  685  		=
if (!nodes && (events < bitmap->mddev->events)) {
ec0cc226854a79 drivers/md/bitmap.c    NeilBrown         2016-11-02  686  		=
	pr_warn("%s: bitmap file is out of date (%llu < %llu) -- forcing full reco=
very\n",
278c1ca2f254d0 drivers/md/bitmap.c    NeilBrown         2012-03-19  687  		=
		bmname(bitmap), events,
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  688  		=
		(unsigned long long) bitmap->mddev->events);
b405fe91e50c60 drivers/md/bitmap.c    NeilBrown         2012-05-22  689  		=
	set_bit(BITMAP_STALE, &bitmap->flags);
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  690  		}
278c1ca2f254d0 drivers/md/bitmap.c    NeilBrown         2012-03-19  691  	}
278c1ca2f254d0 drivers/md/bitmap.c    NeilBrown         2012-03-19  692  =

32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  693  	/=
* assign fields using values from superblock */
4f2e639af4bd5e drivers/md/bitmap.c    NeilBrown         2006-10-21  694  	b=
itmap->flags |=3D le32_to_cpu(sb->state);
bd926c63b7a684 drivers/md/bitmap.c    NeilBrown         2005-11-08  695  	i=
f (le32_to_cpu(sb->version) =3D=3D BITMAP_MAJOR_HOSTENDIAN)
b405fe91e50c60 drivers/md/bitmap.c    NeilBrown         2012-05-22  696  		=
set_bit(BITMAP_HOSTENDIAN, &bitmap->flags);
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  697  	b=
itmap->events_cleared =3D le64_to_cpu(sb->events_cleared);
cf921cc19cf7c1 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-03-30  698  	s=
trlcpy(bitmap->mddev->bitmap_info.cluster_name, sb->cluster_name, 64);
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  699  	e=
rr =3D 0;
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  700  =

32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  701  ou=
t:
b2f46e68825648 drivers/md/bitmap.c    Cong Wang         2011-11-28  702  	k=
unmap_atomic(sb);
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  703  	i=
f (err =3D=3D 0 && nodes && (bitmap->cluster_slot < 0)) {
3560741e316b3e drivers/md/bitmap.c    Zhilong Liu       2017-03-15  704  		=
/* Assigning chunksize is required for "re_read" */
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  705  		=
bitmap->mddev->bitmap_info.chunksize =3D chunksize;
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  706  		=
err =3D md_setup_cluster(bitmap->mddev, nodes);
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  707  		=
if (err) {
ec0cc226854a79 drivers/md/bitmap.c    NeilBrown         2016-11-02  708  		=
	pr_warn("%s: Could not setup cluster service (%d)\n",
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  709  		=
		bmname(bitmap), err);
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  710  		=
	goto out_no_sb;
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  711  		}
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  712  		=
bitmap->cluster_slot =3D md_cluster_ops->slot_number(bitmap->mddev);
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  713  		=
goto re_read;
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  714  	}
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  715  =

b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  716  =

ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  717  ou=
t_no_sb:
b405fe91e50c60 drivers/md/bitmap.c    NeilBrown         2012-05-22  718  	i=
f (test_bit(BITMAP_STALE, &bitmap->flags))
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  719  		=
bitmap->events_cleared =3D bitmap->mddev->events;
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  720  	i=
f (err =3D=3D 0) {
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  721  		=
bitmap->mddev->bitmap_info.chunksize =3D chunksize;
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  722  		=
bitmap->mddev->bitmap_info.daemon_sleep =3D daemon_sleep;
ef99bf480de9bd drivers/md/bitmap.c    NeilBrown         2012-05-22  723  		=
bitmap->mddev->bitmap_info.max_write_behind =3D write_behind;
c4ce867fdad200 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-03-29  724  		=
bitmap->mddev->bitmap_info.nodes =3D nodes;
f9fd5e55a60521 drivers/md/md-bitmap.c Heming Zhao       2022-03-25  725  	}
1dff2b87a34a1a drivers/md/bitmap.c    NeilBrown         2012-05-22  726  	i=
f (bitmap->mddev->bitmap_info.space =3D=3D 0 ||
1dff2b87a34a1a drivers/md/bitmap.c    NeilBrown         2012-05-22  727  	 =
   bitmap->mddev->bitmap_info.space > sectors_reserved)
1dff2b87a34a1a drivers/md/bitmap.c    NeilBrown         2012-05-22  728  		=
bitmap->mddev->bitmap_info.space =3D sectors_reserved;
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  729  	i=
f (err) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  730  		=
md_bitmap_print_sb(bitmap);
f9209a323547f0 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  731  		=
if (bitmap->cluster_slot < 0)
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  732  		=
	md_cluster_stop(bitmap->mddev);
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  733  	}
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  734  	r=
eturn err;
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  735  }
32a7627cf3a353 drivers/md/bitmap.c    NeilBrown         2005-06-21  736  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3111800235429923678==--

