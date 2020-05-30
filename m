Content-Type: multipart/mixed; boundary="===============0404159564366055015=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [jlayton:ceph-fscache-iter 76/77] fs/ceph/addr.c:225 ceph_fsreq_issue_op() error: uninitialized symbol 'err'.
Date: Sun, 31 May 2020 00:44:28 +0300
Message-ID: <20200530214428.GS22511@kadam>
In-Reply-To: <5e1172d332f55803039114c4bb9a93361bcbc29a.camel@kernel.org>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0404159564366055015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2020 at 04:49:40PM -0400, Jeff Layton wrote:
> I wonder -- is there a way to name my branches so that they don't get
> picked up by the 0-day service? I generally like the testing, but when I
> still have a branch that's not yet fully baked it's probably a bit of
> waste. Maybe if we could prefix it with "wip-" or something?

It doesn't take time from me.  You can ignore the Reported-by tags for
new devel work, no one will be offended.

There is a way to disable it but I forget how.  It should probably be
added to the FAQ.  https://01.org/lkp/documentation/0-day-test-service

regards,
dan carpenter
--===============0404159564366055015==--

