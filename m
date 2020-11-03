Content-Type: multipart/mixed; boundary="===============4143504941920672195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] sound/core/seq: remove dead code
Date: Tue, 03 Nov 2020 19:15:30 +0800
Message-ID: <202011031951.2gvdTTwp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4143504941920672195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201102071154.23563-1-yuhaobehappy@gmail.com>
References: <20201102071154.23563-1-yuhaobehappy@gmail.com>
TO: Yu Hao <yuhaobehappy@gmail.com>
TO: perex(a)perex.cz
TO: tiwai(a)suse.com
TO: alsa-devel(a)alsa-project.org
CC: yuhaobehappy(a)gmail.com
CC: linux-kernel(a)vger.kernel.org

Hi Yu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on sound/for-next]
[also build test WARNING on v5.10-rc2 next-20201103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yu-Hao/sound-core-seq-remo=
ve-dead-code/20201102-152326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/core/seq/seq_queue.c:545:16: warning: Unused variable: flags [unus=
edVariable]
    unsigned long flags;
                  ^

vim +545 sound/core/seq/seq_queue.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  539  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  540  /* notification that client=
 has left the system -
^1da177e4c3f415 Linus Torvalds 2005-04-16  541   * stop the timer on all qu=
eues owned by this client
^1da177e4c3f415 Linus Torvalds 2005-04-16  542   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  543  void snd_seq_queue_client_t=
ermination(int client)
^1da177e4c3f415 Linus Torvalds 2005-04-16  544  {
^1da177e4c3f415 Linus Torvalds 2005-04-16 @545  	unsigned long flags;
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
^1da177e4c3f415 Linus Torvalds 2005-04-16  555  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4143504941920672195==--

