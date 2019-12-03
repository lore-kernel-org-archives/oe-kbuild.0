Content-Type: multipart/mixed; boundary="===============8254229115541359806=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [kbuild-all] Re: [PATCH next 2/3] debugfs: introduce debugfs_create_single[, _data]
Date: Tue, 03 Dec 2019 12:32:41 +0300
Message-ID: <20191203092643.GD1787@kadam>
In-Reply-To: <06d63c3c-bab5-c19e-a51d-ac7c1ed0a80c@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8254229115541359806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 05:02:54PM +0800, Rong Chen wrote:
> =

> =

> On 12/3/19 4:38 PM, Dan Carpenter wrote:
> > [ How do I fetch 0day git branchs?
> >    git fetch https://github.com/0day-ci/linux/commits/Kefeng-Wang/debug=
fs-introduce-debugfs_create_single-seq-_data/20191129-173440
> >    doesn't work. - dan ]
> =

> Hi Dan,
> =

> I can fetch it by the following steps:
> =

> nfs(a)shao2-debian:~/linux$ git remote add 0day-linux-review
> https://github.com/0day-ci/linux.git
> nfs(a)shao2-debian:~/linux$ git fetch --no-tags 0day-linux-review
> Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_data/20191129-17=
3440
> =

> remote: Enumerating objects: 25261, done.
> remote: Counting objects: 100% (25261/25261), done.
> remote: Total 33246 (delta 25260), reused 25260 (delta 25260), pack-reused
> 7985
> Receiving objects: 100% (33246/33246), 12.03 MiB | 1.05 MiB/s, done.
> Resolving deltas: 100% (28148/28148), completed with 6149 local objects.
> From https://github.com/0day-ci/linux
> =C2=A0* branch
> Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_data/20191129-17=
3440
> -> FETCH_HEAD
> =C2=A0* [new branch]
> Kefeng-Wang/debugfs-introduce-debugfs_create_single-seq-_data/20191129-17=
3440
> -> 0day-linux-review/Kefeng-Wang/debugfs-introduce-debugfs_create_single-=
seq-_data/20191129-173440
> =


Tracking a remote is unworkably slow on my system.  It's way better to
try fetch a specific branch if possible.

regards,
dan carpenter

--===============8254229115541359806==--

