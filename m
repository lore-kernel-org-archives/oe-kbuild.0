Content-Type: multipart/mixed; boundary="===============5009890006930590600=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [android-common:android-4.19 4/6] fs/incfs/data_mgmt.c:76:13-35: ERROR: reference preceded by free on line 75
Date: Tue, 14 Apr 2020 08:49:26 +0800
Message-ID: <202004140824.oKwa0i94%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5009890006930590600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   580b23c95aa91155ff918f9e7f60024ec8684faa
commit: 5e6feacb2a7c782f5299ab29bc934b93aa601fcf [4/6] ANDROID: Incremental=
 fs: make remount log buffer change atomic
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> fs/incfs/data_mgmt.c:76:13-35: ERROR: reference preceded by free on line=
 75

git remote add android-common https://android.googlesource.com/kernel/common
git remote update android-common
git checkout 5e6feacb2a7c782f5299ab29bc934b93aa601fcf
vim +76 fs/incfs/data_mgmt.c

040942fc50b203 Eugene Zemtsov   2019-11-18  51  =

ae41ea981b3dd5 Paul Lawrence    2020-04-01  52  int incfs_realloc_mount_inf=
o(struct mount_info *mi,
ae41ea981b3dd5 Paul Lawrence    2020-04-01  53  			     struct mount_option=
s *options)
ae41ea981b3dd5 Paul Lawrence    2020-04-01  54  {
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  55  	void *new_buffer =3D NULL;
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  56  	size_t new_buffer_size =3D=
 0;
ae41ea981b3dd5 Paul Lawrence    2020-04-01  57  =

5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  58  	if (options->read_log_page=
s !=3D mi->mi_options.read_log_pages) {
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  59  		struct read_log_state log=
_state;
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  60  		/*
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  61  		 * Even though having two=
 buffers allocated at once isn't
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  62  		 * usually good, allocati=
ng a multipage buffer under a spinlock
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  63  		 * is even worse, so let'=
s optimize for the shorter lock
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  64  		 * duration. It's not end=
 of the world if we fail to increase
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  65  		 * the buffer size anyway.
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  66  		 */
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  67  		if (options->read_log_pag=
es > 0) {
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  68  			new_buffer_size =3D PAGE=
_SIZE * options->read_log_pages;
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  69  			new_buffer =3D kzalloc(n=
ew_buffer_size, GFP_NOFS);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  70  			if (!new_buffer)
ae41ea981b3dd5 Paul Lawrence    2020-04-01  71  				return -ENOMEM;
ae41ea981b3dd5 Paul Lawrence    2020-04-01  72  		}
ae41ea981b3dd5 Paul Lawrence    2020-04-01  73  =

5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  74  		write_lock(&mi->mi_log.rl=
_access_lock);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06 @75  		kfree(mi->mi_log.rl_ring_=
buf);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06 @76  		WRITE_ONCE(mi->mi_log.rl_=
ring_buf, new_buffer);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  77  		WRITE_ONCE(mi->mi_log.rl_=
size,
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  78  			   new_buffer_size / siz=
eof(*mi->mi_log.rl_ring_buf));
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  79  		log_state =3D READ_ONCE(m=
i->mi_log.rl_state);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  80  		log_state.generation_id++;
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  81  		log_state.next_index =3D =
log_state.current_pass_no =3D 0;
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  82  		WRITE_ONCE(mi->mi_log.rl_=
state, log_state);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  83  		write_unlock(&mi->mi_log.=
rl_access_lock);
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  84  	}
5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  85  =

5e6feacb2a7c78 Yurii Zubrytskyi 2020-04-06  86  	mi->mi_options =3D *option=
s;
ae41ea981b3dd5 Paul Lawrence    2020-04-01  87  	return 0;
ae41ea981b3dd5 Paul Lawrence    2020-04-01  88  }
ae41ea981b3dd5 Paul Lawrence    2020-04-01  89  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5009890006930590600==--

