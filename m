Content-Type: multipart/mixed; boundary="===============3204673006739446057=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] sound/core/seq: remove dead code
Date: Tue, 03 Nov 2020 15:03:10 +0300
Message-ID: <20201103120310.GD18329@kadam>
In-Reply-To: <20201102071154.23563-1-yuhaobehappy@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3204673006739446057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yu,

url:    https://github.com/0day-ci/linux/commits/Yu-Hao/sound-core-seq-remo=
ve-dead-code/20201102-152326 =

base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git  fo=
r-next
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/core/seq/seq_queue.c:545:16: warning: Unused variable: flags [unus=
edVariable]
    unsigned long flags;
                  ^

vim +545 sound/core/seq/seq_queue.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  543  void snd_seq_queue_client_t=
ermination(int client)
^1da177e4c3f415 Linus Torvalds 2005-04-16  544  {
^1da177e4c3f415 Linus Torvalds 2005-04-16 @545  	unsigned long flags;
                                                        ^^^^^^^^^^^^^^^^^^^
Unused.

^1da177e4c3f415 Linus Torvalds 2005-04-16  546  	int i;
c7e0b5bf9fff1b7 Takashi Iwai   2005-11-17  547  	struct snd_seq_queue *q;
^1da177e4c3f415 Linus Torvalds 2005-04-16  548  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  549  	for (i =3D 0; i < SNDRV_SE=
Q_MAX_QUEUES; i++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  550  		if ((q =3D queueptr(i)) =
=3D=3D NULL)
^1da177e4c3f415 Linus Torvalds 2005-04-16  551  			continue;
^1da177e4c3f415 Linus Torvalds 2005-04-16  552  		queuefree(q);
^1da177e4c3f415 Linus Torvalds 2005-04-16  553  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  554  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org
--===============3204673006739446057==--

