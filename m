Content-Type: multipart/mixed; boundary="===============4264617984778989706=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/scheduler/sched_main.c:914:3: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Tue, 05 Apr 2022 05:21:29 +0800
Message-ID: <202204050538.kBjGR26S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4264617984778989706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: c61cdbdbffc169dc7f1e6fe94dfffaf574fe672a drm/scheduler: Fix hang wh=
en sched_entity released
date:   11 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 11 months ago
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/scheduler/sched_main.c:914:3: warning: There is an unkno=
wn macro here somewhere. Configuration is required. If list_for_each_entry =
is a macro then please configure it. [unknownMacro]
     list_for_each_entry(s_entity, &rq->entities, list)
     ^

vim +914 drivers/gpu/drm/scheduler/sched_main.c

f49565982194d6 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian K=C3=
=B6nig   2015-08-20  891  =

a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou    =
    2015-05-22  892  /**
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh=
    2018-05-29  893   * drm_sched_fini - Destroy a gpu scheduler
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh=
    2018-05-29  894   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh=
    2018-05-29  895   * @sched: scheduler instance
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou    =
    2015-05-22  896   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh=
    2018-05-29  897   * Tears down and cleans up the scheduler.
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou    =
    2015-05-22  898   */
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach   =
    2017-12-06  899  void drm_sched_fini(struct drm_gpu_scheduler *sched)
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou    =
    2015-05-22  900  {
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  901  	struct drm_sched_entity *s_entity;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  902  	int i;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  903  =

32544d021515f7 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Dave Airlie   =
    2015-11-03  904  	if (sched->thread)
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou    =
    2015-05-22  905  		kthread_stop(sched->thread);
faf6e1a87e0742 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2018-10-18  906  =

c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  907  	for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_S=
CHED_PRIORITY_MIN; i--) {
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  908  		struct drm_sched_rq *rq =3D &sched->sched_rq[i];
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  909  =

c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  910  		if (!rq)
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  911  			continue;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  912  =

c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  913  		spin_lock(&rq->lock);
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12 @914  		list_for_each_entry(s_entity, &rq->entities, list)
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  915  			/*
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  916  			 * Prevents reinsertion and marks job_queue as idle,
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  917  			 * it will removed from rq in drm_sched_entity_fini
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  918  			 * eventually
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  919  			 */
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  920  			s_entity->stopped =3D true;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  921  		spin_unlock(&rq->lock);
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  922  =

c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  923  	}
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  924  =

c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  925  	/* Wakeup everyone stuck in drm_sched_entity_flush fo=
r this scheduler */
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  926  	wake_up_all(&sched->job_scheduled);
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-05-12  927  =

e582951baabba3 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-01-18  928  	/* Confirm no work left behind accessing device struc=
tures */
e582951baabba3 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-01-18  929  	cancel_delayed_work_sync(&sched->work_tdr);
e582951baabba3 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2021-01-18  930  =

faf6e1a87e0742 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzov=
sky 2018-10-18  931  	sched->ready =3D false;
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou    =
    2015-05-22  932  }
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach   =
    2017-12-06  933  EXPORT_SYMBOL(drm_sched_fini);
e6c6338f393b74 drivers/gpu/drm/scheduler/sched_main.c        Jack Zhang    =
    2021-03-08  934  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4264617984778989706==--

