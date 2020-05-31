Content-Type: multipart/mixed; boundary="===============3520099062803399884=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
Subject: Re: [jlayton:ceph-fscache-iter 76/77] fs/ceph/addr.c:225 ceph_fsreq_issue_op() error: uninitialized symbol 'err'.
Date: Sun, 31 May 2020 21:21:37 +0800
Message-ID: <a3be6b48-791d-617f-3254-db2eda2f2154@intel.com>
In-Reply-To: <20200530214428.GS22511@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3520099062803399884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/31/2020 5:44 AM, Dan Carpenter wrote:
> On Sat, May 30, 2020 at 04:49:40PM -0400, Jeff Layton wrote:
>> I wonder -- is there a way to name my branches so that they don't get
>> picked up by the 0-day service? I generally like the testing, but when I
>> still have a branch that's not yet fully baked it's probably a bit of
>> waste. Maybe if we could prefix it with "wip-" or something?
> It doesn't take time from me.  You can ignore the Reported-by tags for
> new devel work, no one will be offended.
>
> There is a way to disable it but I forget how.  It should probably be
> added to the FAQ.  https://01.org/lkp/documentation/0-day-test-service

Hi all,

We have a FAQ for this: https://github.com/intel/lkp-tests/wiki/LKP-FAQ

Best Regards,
Rong Chen
--===============3520099062803399884==--

