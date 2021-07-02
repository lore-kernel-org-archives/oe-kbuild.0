Content-Type: multipart/mixed; boundary="===============5099279188649034341=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v5
Date: Sat, 03 Jul 2021 00:00:31 +0800
Message-ID: <202107022337.yVItk27c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5099279188649034341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210702103143.16824-1-christian.koenig@amd.com>
References: <20210702103143.16824-1-christian.koenig@amd.com>
TO: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
TO: dri-devel(a)lists.freedesktop.org
TO: daniel.vetter(a)ffwll.ch

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[also build test WARNING on v5.13]
[cannot apply to linus/master next-20210701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/dma-buf-fi=
x-and-rework-dma_buf_poll-v5/20210702-183256
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/dma-buf/dma-buf.c:253:11: warning: Unused variable: shared_count=
 [unusedVariable]
    unsigned shared_count;
             ^
>> drivers/dma-buf/dma-buf.c:255:6: warning: Unused variable: r [unusedVari=
able]
    int r, i;
        ^
>> drivers/dma-buf/dma-buf.c:255:9: warning: Unused variable: i [unusedVari=
able]
    int r, i;
           ^

vim +253 drivers/dma-buf/dma-buf.c

9b495a5887994a Maarten Lankhorst 2014-07-01  248  =

afc9a42b7464f7 Al Viro           2017-07-03  249  static __poll_t dma_buf_p=
oll(struct file *file, poll_table *poll)
9b495a5887994a Maarten Lankhorst 2014-07-01  250  {
9b495a5887994a Maarten Lankhorst 2014-07-01  251  	struct dma_buf *dmabuf;
52791eeec1d9f4 Christian K=C3=B6nig   2019-08-11  252  	struct dma_resv *re=
sv;
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02 @253  	unsigned shared_cou=
nt;
01699437758328 Al Viro           2017-07-03  254  	__poll_t events;
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02 @255  	int r, i;
9b495a5887994a Maarten Lankhorst 2014-07-01  256  =

9b495a5887994a Maarten Lankhorst 2014-07-01  257  	dmabuf =3D file->private=
_data;
9b495a5887994a Maarten Lankhorst 2014-07-01  258  	if (!dmabuf || !dmabuf->=
resv)
a9a08845e9acbd Linus Torvalds    2018-02-11  259  		return EPOLLERR;
9b495a5887994a Maarten Lankhorst 2014-07-01  260  =

9b495a5887994a Maarten Lankhorst 2014-07-01  261  	resv =3D dmabuf->resv;
9b495a5887994a Maarten Lankhorst 2014-07-01  262  =

9b495a5887994a Maarten Lankhorst 2014-07-01  263  	poll_wait(file, &dmabuf-=
>poll, poll);
9b495a5887994a Maarten Lankhorst 2014-07-01  264  =

a9a08845e9acbd Linus Torvalds    2018-02-11  265  	events =3D poll_requeste=
d_events(poll) & (EPOLLIN | EPOLLOUT);
9b495a5887994a Maarten Lankhorst 2014-07-01  266  	if (!events)
9b495a5887994a Maarten Lankhorst 2014-07-01  267  		return 0;
9b495a5887994a Maarten Lankhorst 2014-07-01  268  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  269  	dma_resv_lock(resv,=
 NULL);
9b495a5887994a Maarten Lankhorst 2014-07-01  270  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  271  	if (events & EPOLLO=
UT) {
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  272  		struct dma_buf_pol=
l_cb_t *dcb =3D &dmabuf->cb_out;
9b495a5887994a Maarten Lankhorst 2014-07-01  273  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  274  		/* Check that call=
back isn't busy */
9b495a5887994a Maarten Lankhorst 2014-07-01  275  		spin_lock_irq(&dmabuf->=
poll.lock);
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  276  		if (dcb->active)
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  277  			events &=3D ~EPOL=
LOUT;
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  278  		else
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  279  			dcb->active =3D E=
POLLOUT;
9b495a5887994a Maarten Lankhorst 2014-07-01  280  		spin_unlock_irq(&dmabuf=
->poll.lock);
9b495a5887994a Maarten Lankhorst 2014-07-01  281  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  282  		if (events & EPOLL=
OUT && !dma_buf_poll_shared(resv, dcb) &&
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  283  		    !dma_buf_poll_=
excl(resv, dcb))
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  284  			/* No callback qu=
eued, wake up any other waiters */
3c3b177a9369b2 Maarten Lankhorst 2014-07-01  285  			dma_buf_poll_cb(NULL, =
&dcb->cb);
04a5faa8cbe5a8 Maarten Lankhorst 2014-07-01  286  	}
9b495a5887994a Maarten Lankhorst 2014-07-01  287  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  288  	if (events & EPOLLI=
N) {
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  289  		struct dma_buf_pol=
l_cb_t *dcb =3D &dmabuf->cb_in;
9b495a5887994a Maarten Lankhorst 2014-07-01  290  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  291  		/* Check that call=
back isn't busy */
9b495a5887994a Maarten Lankhorst 2014-07-01  292  		spin_lock_irq(&dmabuf->=
poll.lock);
9b495a5887994a Maarten Lankhorst 2014-07-01  293  		if (dcb->active)
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  294  			events &=3D ~EPOL=
LIN;
9b495a5887994a Maarten Lankhorst 2014-07-01  295  		else
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  296  			dcb->active =3D E=
POLLIN;
9b495a5887994a Maarten Lankhorst 2014-07-01  297  		spin_unlock_irq(&dmabuf=
->poll.lock);
9b495a5887994a Maarten Lankhorst 2014-07-01  298  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  299  		if (events & EPOLL=
IN && !dma_buf_poll_excl(resv, dcb))
5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  300  			/* No callback qu=
eued, wake up any other waiters */
9b495a5887994a Maarten Lankhorst 2014-07-01  301  			dma_buf_poll_cb(NULL, =
&dcb->cb);
9b495a5887994a Maarten Lankhorst 2014-07-01  302  	}
9b495a5887994a Maarten Lankhorst 2014-07-01  303  =

5bb0f0637b179f Christian K=C3=B6nig   2021-07-02  304  	dma_resv_unlock(res=
v);
9b495a5887994a Maarten Lankhorst 2014-07-01  305  	return events;
9b495a5887994a Maarten Lankhorst 2014-07-01  306  }
9b495a5887994a Maarten Lankhorst 2014-07-01  307  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5099279188649034341==--

