Content-Type: multipart/mixed; boundary="===============3056078475317712979=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 03/15] iomap: Allow filesystem to call iomap_dio_complete without i_rwsem
Date: Tue, 22 Sep 2020 17:58:22 +0300
Message-ID: <20200922145822.GD18329@kadam>
In-Reply-To: <20200922141649.lgu46wzn2yjdcgcp@fiona>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3056078475317712979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 09:16:49AM -0500, Goldwyn Rodrigues wrote:
> Hi Dan,
> =

> On 12:24 22/09, Dan Carpenter wrote:
> > Hi Goldwyn,
> > =

> > url:    https://github.com/0day-ci/linux/commits/Goldwyn-Rodrigues/BTRF=
S-DIO-inode-locking-D_SYNC-fix/20200921-224649 =

> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git=
  for-next
> > config: x86_64-randconfig-m001-20200920 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > fs/iomap/direct-io.c:582 __iomap_dio_rw() warn: passing zero to 'ERR_PT=
R'
> =

> This looks like a false warning. The code goes to the out_free_dio only
> if ret < 0.

The email has a full copy of the function and I noted the place where
"ret" was set to zero.

It's possible that this was a merge error with the kbuild bot?

regards,
dan carpenter


--===============3056078475317712979==--

