Content-Type: multipart/mixed; boundary="===============5403048565094160543=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 2079/2594] fs/btrfs/volumes.c:6546 __btrfs_map_block() error: we previously assumed 'mirror_num_p' could be null (see line 6373)
Date: Wed, 24 Aug 2022 09:21:55 +0300
Message-ID: <20220824055446.GL2719@kadam>
In-Reply-To: <20220824053527.GA18584@lst.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5403048565094160543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 07:35:27AM +0200, Christoph Hellwig wrote:
> On Wed, Aug 24, 2022 at 08:28:26AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git   master
> > head:   05477f3653b82d8b3bcf39d2937d9893124976db
> > commit: 51bf2819055847ce90006a368f8d2c07f408dd33 [2079/2594] btrfs: mak=
e the btrfs_io_context allocation in __btrfs_map_block optional
> > config: nios2-randconfig-m031-20220824 (https://download.01.org/0day-ci=
/archive/20220824/202208240734.u4Y7Q6sW-lkp(a)intel.com/config  )
> > compiler: nios2-linux-gcc (GCC) 12.1.0
> > =

> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> =

> The calling convention implies that either smap and mirror_num_p are both
> NULL or neither.  We could add an extra check to shut up the validator
> if this really helps.

No need.  That's a simple relationship and the warning should be
silenced if you have the cross function DB information.  (It's just not
possible to build the cross function DB for the number of builds that
the kbuild-bot does).

regards,
dan carpenter
--===============5403048565094160543==--

