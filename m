Content-Type: multipart/mixed; boundary="===============6619243630332140530=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
Subject: Re: [PATCH v0.7 3/5] sched/umcg: implement UMCG syscalls
Date: Fri, 15 Oct 2021 09:27:04 +0800
Message-ID: <89dcdc16-0c51-3ff5-8806-e92bd82881f0@intel.com>
In-Reply-To: <20211014064147.GL8429@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6619243630332140530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On 10/14/2021 2:41 PM, Dan Carpenter wrote:
> On Thu, Oct 14, 2021 at 02:56:43AM +0800, kernel test robot wrote:
>>
>> url:    https://github.com/0day-ci/linux/commits/Peter-Oskolkov/sched-mm=
-x86-uaccess-implement-User-Managed-Concurrency-Groups/20211013-072710
> =

> How do I do a git fetch of this again?

Please try below steps to see if it can work:

$ cd linux
$ git remote add linux-review-github https://github.com/0day-ci/linux
$ git fetch --no-tags linux-review-github Peter-Oskolkov/sched-mm-x86-uacce=
ss-implement-User-Managed-Concurrency-Groups/20211013-072710
 From https://github.com/0day-ci/linux
  * branch                      Peter-Oskolkov/sched-mm-x86-uaccess-impleme=
nt-User-Managed-Concurrency-Groups/20211013-072710 -> FETCH_HEAD
  * [new branch]                Peter-Oskolkov/sched-mm-x86-uaccess-impleme=
nt-User-Managed-Concurrency-Groups/20211013-072710 -> linux-review-github/P=
eter-Oskolkov/sched-mm-x86-uaccess-implement-User-Managed-Concurrency-Group=
s/20211013-072710
$ git checkout 0dcffc800cf354
HEAD is now at 0dcffc800cf3 sched/umcg: implement UMCG syscalls

Regards,
Yujie

> =

> regards,
> dan carpenter
> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org
>=20
--===============6619243630332140530==--

