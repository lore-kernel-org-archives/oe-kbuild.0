Content-Type: multipart/mixed; boundary="===============7371600984849503693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-split 8/17] fs/btrfs/volumes.c:6675:12: sparse: struct bio *extern [addressable] [toplevel] btrfs_bio_alloc( ... )
Date: Fri, 02 Sep 2022 06:33:31 +0800
Message-ID: <202209020650.6f7j3m0S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7371600984849503693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
volumes.c:6675:12: sparse:    struct bio *extern [addressable] [toplevel] b=
trfs_bio_alloc( ... )"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-split
head:   557db0fac4ee6917f81d59f65bb1cd1fd4059d06
commit: 5cb8eee95f29a8b8a48110393a7b37a563429e2d [8/17] btrfs: pass the iom=
ap bio to btrfs_submit_bio
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/202=
20902/202209020650.6f7j3m0S-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc btrfs-bio-split
        git checkout 5cb8eee95f29a8b8a48110393a7b37a563429e2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   fs/btrfs/volumes.c:411:31: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct rcu_string *str @@     go=
t struct rcu_string [noderef] __rcu *name @@
   fs/btrfs/volumes.c:411:31: sparse:     expected struct rcu_string *str
   fs/btrfs/volumes.c:411:31: sparse:     got struct rcu_string [noderef] _=
_rcu *name
   fs/btrfs/volumes.c:619:43: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected char const *device_path @@     g=
ot char [noderef] __rcu * @@
   fs/btrfs/volumes.c:619:43: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:619:43: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:886:50: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected char const * @@     got char [no=
deref] __rcu * @@
   fs/btrfs/volumes.c:886:50: sparse:     expected char const *
   fs/btrfs/volumes.c:886:50: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:956:39: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct rcu_string *str @@     go=
t struct rcu_string [noderef] __rcu *name @@
   fs/btrfs/volumes.c:956:39: sparse:     expected struct rcu_string *str
   fs/btrfs/volumes.c:956:39: sparse:     got struct rcu_string [noderef] _=
_rcu *name
   fs/btrfs/volumes.c:1013:58: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected char const *src @@     got char=
 [noderef] __rcu * @@
   fs/btrfs/volumes.c:1013:58: sparse:     expected char const *src
   fs/btrfs/volumes.c:1013:58: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:2195:49: sparse: sparse: incorrect type in argument 3=
 (different address spaces) @@     expected char const *device_path @@     =
got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:2195:49: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2195:49: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:2310:41: sparse: sparse: incorrect type in argument 3=
 (different address spaces) @@     expected char const *device_path @@     =
got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:2310:41: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2310:41: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:6675:12: sparse: sparse: symbol 'btrfs_bio_alloc' red=
eclared with different type (incompatible argument 2 (different base types)=
):
>> fs/btrfs/volumes.c:6675:12: sparse:    struct bio *extern [addressable] =
[toplevel] btrfs_bio_alloc( ... )
   fs/btrfs/volumes.c: note: in included file:
   fs/btrfs/volumes.h:409:12: sparse: note: previously declared as:
>> fs/btrfs/volumes.h:409:12: sparse:    struct bio *extern [addressable] [=
toplevel] btrfs_bio_alloc( ... )
   fs/btrfs/volumes.c:7127:21: sparse: sparse: incorrect type in assignment=
 (different base types) @@     expected restricted blk_status_t [usertype] =
ret @@     got int @@
   fs/btrfs/volumes.c:7127:21: sparse:     expected restricted blk_status_t=
 [usertype] ret
   fs/btrfs/volumes.c:7127:21: sparse:     got int
   fs/btrfs/volumes.c:7129:21: sparse: sparse: incorrect type in assignment=
 (different base types) @@     expected restricted blk_status_t [usertype] =
ret @@     got int @@
   fs/btrfs/volumes.c:7129:21: sparse:     expected restricted blk_status_t=
 [usertype] ret
   fs/btrfs/volumes.c:7129:21: sparse:     got int
   fs/btrfs/volumes.c:7131:59: sparse: sparse: incorrect type in argument 1=
 (different base types) @@     expected int errno @@     got restricted blk=
_status_t [usertype] ret @@
   fs/btrfs/volumes.c:7131:59: sparse:     expected int errno
   fs/btrfs/volumes.c:7131:59: sparse:     got restricted blk_status_t [use=
rtype] ret

vim +6675 fs/btrfs/volumes.c

dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6667  =

dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6668  /*
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6669   * Allocate a btrfs_bio =
structure.  The btrfs_bio is the main I/O container for
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6670   * btrfs, and is used fo=
r all I/O submitted through btrfs_submit_bio.
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6671   *
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6672   * Just like the underly=
ing bio_alloc_bioset it will not fail as it is backed by
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6673   * a mempool.
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6674   */
f3b87f12e86819 Christoph Hellwig 2022-08-06 @6675  struct bio *btrfs_bio_al=
loc(unsigned int nr_vecs, blk_opf_t opf,
7a43c1b7df7b57 Christoph Hellwig 2022-08-24  6676  			    struct inode *ino=
de, btrfs_bio_end_io_t end_io,
7a43c1b7df7b57 Christoph Hellwig 2022-08-24  6677  			    void *private)
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6678  {
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6679  	struct bio *bio;
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6680  =

b864cb98148695 Christoph Hellwig 2022-08-06  6681  	bio =3D bio_alloc_biose=
t(NULL, nr_vecs, opf, GFP_NOFS, &btrfs_bioset);
7a43c1b7df7b57 Christoph Hellwig 2022-08-24  6682  	btrfs_bio_init(btrfs_bi=
o(bio), inode, end_io, private);
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6683  	return bio;
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6684  }
dcbd230ea59aa3 Christoph Hellwig 2022-08-06  6685  =


:::::: The code at line 6675 was first introduced by commit
:::::: f3b87f12e86819327a651c1406f4cafd5d4534da btrfs: give struct btrfs_bi=
o a real end_io handler

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: David Sterba <dsterba@suse.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7371600984849503693==--

