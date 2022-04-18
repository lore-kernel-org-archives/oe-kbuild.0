Content-Type: multipart/mixed; boundary="===============7543089328925115195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:axboe/linux-block/for-5.19/drivers 15/50] block/bfq-cgroup.c:1457:9: warning: Null pointer dereference: bfqd [ctunullpointer]
Date: Mon, 18 Apr 2022 15:13:48 +0800
Message-ID: <202204181528.PAcE3SGf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7543089328925115195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Jan Kara <jack@suse.cz>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-5.=
19/drivers
head:   8fd6533ef3f7729e4aa29ead83844c042688615a
commit: 4e54a2493e582361adc3bfbf06c7d50d19d18837 [15/50] bfq: Get rid of __=
bio_blkcg() usage
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4e54a2493e582361adc3bfbf06c7d50d19d18837
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   block/bfq-cgroup.c:1026:9: warning: Redundant assignment of 'weight' to =
itself. [selfAssignment]
    weight =3D dev_weight ?: weight;
           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   block/bfq-cgroup.c:139:26: warning: Parameter 'curr_bfqg' can be declare=
d with const [constParameter]
          struct bfq_group *curr_bfqg)
                            ^
   block/bfq-cgroup.c:380:51: warning: Parameter 'to' can be declared with =
const [constParameter]
   static void bfqg_stats_add_aux(struct bfqg_stats *to, struct bfqg_stats =
*from)
                                                     ^
   block/bfq-cgroup.c:380:74: warning: Parameter 'from' can be declared wit=
h const [constParameter]
   static void bfqg_stats_add_aux(struct bfqg_stats *to, struct bfqg_stats =
*from)
                                                                           =
 ^
>> block/bfq-cgroup.c:1457:9: warning: Null pointer dereference: bfqd [ctun=
ullpointer]
    return bfqd->root_group;
           ^
   block/bfq-cgroup.c:777:15: note: Assuming that condition '!bfqd' is not =
redundant
   =

                 ^
   block/bfq-cgroup.c:768:39: note: Calling function bfq_bio_bfqg, 1st argu=
ment is null
    struct bfq_group *bfqg =3D bfq_bio_bfqg(bfqd, bio);
                                         ^
   block/bfq-cgroup.c:1457:9: note: Dereferencing argument bfqd that is null
    return bfqd->root_group;
           ^

vim +1457 block/bfq-cgroup.c

ea25da48086d3bb Paolo Valente 2017-04-19  1454  =

4e54a2493e58236 Jan Kara      2022-04-01  1455  struct bfq_group *bfq_bio_b=
fqg(struct bfq_data *bfqd, struct bio *bio)
ea25da48086d3bb Paolo Valente 2017-04-19  1456  {
ea25da48086d3bb Paolo Valente 2017-04-19 @1457  	return bfqd->root_group;
ea25da48086d3bb Paolo Valente 2017-04-19  1458  }
ea25da48086d3bb Paolo Valente 2017-04-19  1459  =


:::::: The code at line 1457 was first introduced by commit
:::::: ea25da48086d3bbebf3a2eeff387ea00ed96f5c4 block, bfq: split bfq-iosch=
ed.c into multiple source files

:::::: TO: Paolo Valente <paolo.valente@linaro.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7543089328925115195==--

