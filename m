Content-Type: multipart/mixed; boundary="===============6645005139768447513=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8715/9759] drivers/block/null_blk/main.c:2111:12: warning: Uninitialized variables: nb.dev, nb.list, nb.index, nb.q, nb.disk, nb.tag_set, nb.__tag_set, nb.queue_depth, nb.cur_bytes, nb.bw_timer, nb.cache_flush_pos, nb.lock, nb.queues, nb.nr_queues [uninitvar]
Date: Sat, 07 May 2022 02:44:54 +0800
Message-ID: <202205070247.jCXL845V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6645005139768447513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 49c3b9266a718dbd73c42e004288b4bb2ea0ac0b [8715/9759] block: null_bl=
k: Improve device creation with configfs
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 49c3b9266a718dbd73c42e004288b4bb2ea0ac0b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/block/null_blk/main.c:1911:26: warning: The statement 'if (dev->=
submit_queues!=3Dnr_online_nodes) dev->submit_queues=3Dnr_online_nodes' is =
logically equivalent to 'dev->submit_queues=3Dnr_online_nodes'. [duplicateC=
onditionalAssign]
     if (dev->submit_queues !=3D nr_online_nodes)
                            ^
   drivers/block/null_blk/main.c:1912:23: note: Assignment 'dev->submit_que=
ues=3Dnr_online_nodes'
      dev->submit_queues =3D nr_online_nodes;
                         ^
   drivers/block/null_blk/main.c:1911:26: note: Condition 'dev->submit_queu=
es!=3Dnr_online_nodes' is redundant
     if (dev->submit_queues !=3D nr_online_nodes)
                            ^
>> drivers/block/null_blk/main.c:2111:12: warning: Uninitialized variables:=
 nb.dev, nb.list, nb.index, nb.q, nb.disk, nb.tag_set, nb.__tag_set, nb.que=
ue_depth, nb.cur_bytes, nb.bw_timer, nb.cache_flush_pos, nb.lock, nb.queues=
, nb.nr_queues [uninitvar]
      nullb =3D nb;
              ^

vim +2111 drivers/block/null_blk/main.c

f2298c0403b0df drivers/block/null_blk.c      Jens Axboe     2013-10-25  210=
3  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  210=
4  static struct nullb *null_find_dev_by_name(const char *name)
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  210=
5  {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  210=
6  	struct nullb *nullb =3D NULL, *nb;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  210=
7  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  210=
8  	mutex_lock(&lock);
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  210=
9  	list_for_each_entry(nb, &nullb_list, list) {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
0  		if (strcmp(nb->disk_name, name) =3D=3D 0) {
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20 @211=
1  			nullb =3D nb;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
2  			break;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
3  		}
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
4  	}
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
5  	mutex_unlock(&lock);
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
6  =

49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
7  	return nullb;
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
8  }
49c3b9266a718d drivers/block/null_blk/main.c Damien Le Moal 2022-04-20  211=
9  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6645005139768447513==--

