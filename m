Content-Type: multipart/mixed; boundary="===============3092765234680146607=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c:412 sun8i_ce_hash_run() warn: possible memory leak of 'result'
Date: Wed, 11 Nov 2020 12:56:21 +0300
Message-ID: <20201111095621.GJ29398@kadam>
In-Reply-To: <20201111080134.GA4359@Red>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3092765234680146607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 09:01:34AM +0100, LABBE Corentin wrote:
> On Tue, Nov 10, 2020 at 01:47:37PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   407ab579637ced6dc32cfb2295afb7259cca4b22
> > commit: 56f6d5aee88d129b2424902cd630f10794550763 crypto: sun8i-ce - sup=
port hash algorithms
> > config: x86_64-randconfig-m001-20201109 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> =

> Hello
> =

> Thanks for the report, I will send a patch soon.
> Note that you should send this report to the maintainer also (but this ti=
me it is me with another address, so its fine).
> =


These are automated emails from the kbuild bot.  I just look over the
Smatch warnings and forward them.  It don't know how the CC list is
chosen.  I guess just from who signed off on the patch...  My guess is
that people would be annoyed if we CC'd more people.

Generally, we have a really good success rate with people fixing these
warnings.  I recently had a case where the zero day bot email wasn't
clear, but I caught that because I'm looking at new Smatch warnings on
my own system.  There was another case, where the bug was fixed and then
re-introduced via a bad merge and we almost missed that because it was
marked as old.  Fortunately, I discoverd it while looking at a different
bug.

regards,
dan carpenter
--===============3092765234680146607==--

