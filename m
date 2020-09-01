Content-Type: multipart/mixed; boundary="===============6340146894131313286=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [block:for-next 14/18] block/blk-merge.c:999:26: warning: Redundant condition: sched_allow_merge. '!A || (A && B)' is equivalent to '!A || B'
Date: Wed, 02 Sep 2020 03:36:23 +0800
Message-ID: <202009020318.W5PpGCGb%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6340146894131313286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
head:   38f02fdbc7a5d5c4fc765e12541eab8b27b0eb91
commit: c7c06419eb01c4990598c960f337bd7c3d4fc377 [14/18] block: Add a new h=
elper to attempt to merge a bio
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> block/blk-merge.c:999:26: warning: Redundant condition: sched_allow_merg=
e. '!A || (A && B)' is equivalent to '!A || B' [redundantCondition]
     if (!sched_allow_merge ||
                            ^
   block/blk-merge.c:1004:26: warning: Redundant condition: sched_allow_mer=
ge. '!A || (A && B)' is equivalent to '!A || B' [redundantCondition]
     if (!sched_allow_merge ||
                            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/com=
mit/?id=3Dc7c06419eb01c4990598c960f337bd7c3d4fc377
git remote add block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/=
linux-block.git
git fetch --no-tags block for-next
git checkout c7c06419eb01c4990598c960f337bd7c3d4fc377
vim +999 block/blk-merge.c

c7c06419eb01c4 Baolin Wang 2020-08-28   987  =

c7c06419eb01c4 Baolin Wang 2020-08-28   988  static enum bio_merge_status b=
lk_attempt_bio_merge(struct request_queue *q,
c7c06419eb01c4 Baolin Wang 2020-08-28   989  						   struct request *rq,
c7c06419eb01c4 Baolin Wang 2020-08-28   990  						   struct bio *bio,
c7c06419eb01c4 Baolin Wang 2020-08-28   991  						   unsigned int nr_segs,
c7c06419eb01c4 Baolin Wang 2020-08-28   992  						   bool sched_allow_merg=
e)
c7c06419eb01c4 Baolin Wang 2020-08-28   993  {
c7c06419eb01c4 Baolin Wang 2020-08-28   994  	if (!blk_rq_merge_ok(rq, bio))
c7c06419eb01c4 Baolin Wang 2020-08-28   995  		return BIO_MERGE_NONE;
c7c06419eb01c4 Baolin Wang 2020-08-28   996  =

c7c06419eb01c4 Baolin Wang 2020-08-28   997  	switch (blk_try_merge(rq, bio=
)) {
c7c06419eb01c4 Baolin Wang 2020-08-28   998  	case ELEVATOR_BACK_MERGE:
c7c06419eb01c4 Baolin Wang 2020-08-28  @999  		if (!sched_allow_merge ||
c7c06419eb01c4 Baolin Wang 2020-08-28  1000  		    (sched_allow_merge && bl=
k_mq_sched_allow_merge(q, rq, bio)))
c7c06419eb01c4 Baolin Wang 2020-08-28  1001  			return bio_attempt_back_mer=
ge(rq, bio, nr_segs);
c7c06419eb01c4 Baolin Wang 2020-08-28  1002  		break;
c7c06419eb01c4 Baolin Wang 2020-08-28  1003  	case ELEVATOR_FRONT_MERGE:
c7c06419eb01c4 Baolin Wang 2020-08-28  1004  		if (!sched_allow_merge ||
c7c06419eb01c4 Baolin Wang 2020-08-28  1005  		    (sched_allow_merge && bl=
k_mq_sched_allow_merge(q, rq, bio)))
c7c06419eb01c4 Baolin Wang 2020-08-28  1006  			return bio_attempt_front_me=
rge(rq, bio, nr_segs);
c7c06419eb01c4 Baolin Wang 2020-08-28  1007  		break;
c7c06419eb01c4 Baolin Wang 2020-08-28  1008  	case ELEVATOR_DISCARD_MERGE:
c7c06419eb01c4 Baolin Wang 2020-08-28  1009  		return bio_attempt_discard_m=
erge(q, rq, bio);
c7c06419eb01c4 Baolin Wang 2020-08-28  1010  	default:
c7c06419eb01c4 Baolin Wang 2020-08-28  1011  		return BIO_MERGE_NONE;
c7c06419eb01c4 Baolin Wang 2020-08-28  1012  	}
c7c06419eb01c4 Baolin Wang 2020-08-28  1013  =

c7c06419eb01c4 Baolin Wang 2020-08-28  1014  	return BIO_MERGE_FAILED;
a7a10c146dc70e Baolin Wang 2020-08-28  1015  }
a7a10c146dc70e Baolin Wang 2020-08-28  1016  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6340146894131313286==--

