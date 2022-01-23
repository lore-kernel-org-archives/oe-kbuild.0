Content-Type: multipart/mixed; boundary="===============0115987926980227803=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/core/pcm_compat.c:507 snd_pcm_ioctl_sync_ptr_buggy() error: copy_from_user() 'sync_cp' too small (16 vs 20)
Date: Sun, 23 Jan 2022 10:47:01 +0800
Message-ID: <202201231006.a09w1SNC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0115987926980227803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: 228af5a4fa3a8293bd8b7ac5cf59548ee29627bf ALSA: pcm: Workaround for =
a wrong offset in SYNC_PTR compat ioctl
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220123/202201231006.a09w1SNC-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/core/pcm_compat.c:507 snd_pcm_ioctl_sync_ptr_buggy() error: copy_from=
_user() 'sync_cp' too small (16 vs 20)

vim +/sync_cp +507 sound/core/pcm_compat.c

228af5a4fa3a82 Takashi Iwai 2021-10-10  492  =

228af5a4fa3a82 Takashi Iwai 2021-10-10  493  static int snd_pcm_ioctl_sync_=
ptr_buggy(struct snd_pcm_substream *substream,
228af5a4fa3a82 Takashi Iwai 2021-10-10  494  					struct snd_pcm_sync_ptr _=
_user *_sync_ptr)
228af5a4fa3a82 Takashi Iwai 2021-10-10  495  {
228af5a4fa3a82 Takashi Iwai 2021-10-10  496  	struct snd_pcm_runtime *runti=
me =3D substream->runtime;
228af5a4fa3a82 Takashi Iwai 2021-10-10  497  	struct snd_pcm_sync_ptr sync_=
ptr;
228af5a4fa3a82 Takashi Iwai 2021-10-10  498  	struct __snd_pcm_mmap_control=
64_buggy *sync_cp;
228af5a4fa3a82 Takashi Iwai 2021-10-10  499  	volatile struct snd_pcm_mmap_=
status *status;
228af5a4fa3a82 Takashi Iwai 2021-10-10  500  	volatile struct snd_pcm_mmap_=
control *control;
228af5a4fa3a82 Takashi Iwai 2021-10-10  501  	int err;
228af5a4fa3a82 Takashi Iwai 2021-10-10  502  =

228af5a4fa3a82 Takashi Iwai 2021-10-10  503  	memset(&sync_ptr, 0, sizeof(s=
ync_ptr));
228af5a4fa3a82 Takashi Iwai 2021-10-10  504  	sync_cp =3D (struct __snd_pcm=
_mmap_control64_buggy *)&sync_ptr.c.control;
228af5a4fa3a82 Takashi Iwai 2021-10-10  505  	if (get_user(sync_ptr.flags, =
(unsigned __user *)&(_sync_ptr->flags)))
228af5a4fa3a82 Takashi Iwai 2021-10-10  506  		return -EFAULT;
228af5a4fa3a82 Takashi Iwai 2021-10-10 @507  	if (copy_from_user(sync_cp, &=
(_sync_ptr->c.control), sizeof(*sync_cp)))
228af5a4fa3a82 Takashi Iwai 2021-10-10  508  		return -EFAULT;
228af5a4fa3a82 Takashi Iwai 2021-10-10  509  	status =3D runtime->status;
228af5a4fa3a82 Takashi Iwai 2021-10-10  510  	control =3D runtime->control;
228af5a4fa3a82 Takashi Iwai 2021-10-10  511  	if (sync_ptr.flags & SNDRV_PC=
M_SYNC_PTR_HWSYNC) {
228af5a4fa3a82 Takashi Iwai 2021-10-10  512  		err =3D snd_pcm_hwsync(subst=
ream);
228af5a4fa3a82 Takashi Iwai 2021-10-10  513  		if (err < 0)
228af5a4fa3a82 Takashi Iwai 2021-10-10  514  			return err;
228af5a4fa3a82 Takashi Iwai 2021-10-10  515  	}
228af5a4fa3a82 Takashi Iwai 2021-10-10  516  	snd_pcm_stream_lock_irq(subst=
ream);
228af5a4fa3a82 Takashi Iwai 2021-10-10  517  	if (!(sync_ptr.flags & SNDRV_=
PCM_SYNC_PTR_APPL)) {
228af5a4fa3a82 Takashi Iwai 2021-10-10  518  		err =3D pcm_lib_apply_appl_p=
tr(substream, sync_cp->appl_ptr);
228af5a4fa3a82 Takashi Iwai 2021-10-10  519  		if (err < 0) {
228af5a4fa3a82 Takashi Iwai 2021-10-10  520  			snd_pcm_stream_unlock_irq(s=
ubstream);
228af5a4fa3a82 Takashi Iwai 2021-10-10  521  			return err;
228af5a4fa3a82 Takashi Iwai 2021-10-10  522  		}
228af5a4fa3a82 Takashi Iwai 2021-10-10  523  	} else {
228af5a4fa3a82 Takashi Iwai 2021-10-10  524  		sync_cp->appl_ptr =3D contro=
l->appl_ptr;
228af5a4fa3a82 Takashi Iwai 2021-10-10  525  	}
228af5a4fa3a82 Takashi Iwai 2021-10-10  526  	if (!(sync_ptr.flags & SNDRV_=
PCM_SYNC_PTR_AVAIL_MIN))
228af5a4fa3a82 Takashi Iwai 2021-10-10  527  		control->avail_min =3D sync_=
cp->avail_min;
228af5a4fa3a82 Takashi Iwai 2021-10-10  528  	else
228af5a4fa3a82 Takashi Iwai 2021-10-10  529  		sync_cp->avail_min =3D contr=
ol->avail_min;
228af5a4fa3a82 Takashi Iwai 2021-10-10  530  	sync_ptr.s.status.state =3D s=
tatus->state;
228af5a4fa3a82 Takashi Iwai 2021-10-10  531  	sync_ptr.s.status.hw_ptr =3D =
status->hw_ptr;
228af5a4fa3a82 Takashi Iwai 2021-10-10  532  	sync_ptr.s.status.tstamp =3D =
status->tstamp;
228af5a4fa3a82 Takashi Iwai 2021-10-10  533  	sync_ptr.s.status.suspended_s=
tate =3D status->suspended_state;
228af5a4fa3a82 Takashi Iwai 2021-10-10  534  	sync_ptr.s.status.audio_tstam=
p =3D status->audio_tstamp;
228af5a4fa3a82 Takashi Iwai 2021-10-10  535  	snd_pcm_stream_unlock_irq(sub=
stream);
228af5a4fa3a82 Takashi Iwai 2021-10-10  536  	if (copy_to_user(_sync_ptr, &=
sync_ptr, sizeof(sync_ptr)))
228af5a4fa3a82 Takashi Iwai 2021-10-10  537  		return -EFAULT;
228af5a4fa3a82 Takashi Iwai 2021-10-10  538  	return 0;
228af5a4fa3a82 Takashi Iwai 2021-10-10  539  }
228af5a4fa3a82 Takashi Iwai 2021-10-10  540  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0115987926980227803==--

