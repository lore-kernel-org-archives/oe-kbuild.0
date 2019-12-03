Content-Type: multipart/mixed; boundary="===============8130759612917852375=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [atishp04:efi_stub 1/1] drivers/firmware/efi/libstub/arm-stub.c:203:7: warning: variable 'secure_boot' is uninitialized when used here
Date: Tue, 03 Dec 2019 16:52:20 +0800
Message-ID: <0960ae97-8758-628e-7c42-2d0f982c3759@intel.com>
In-Reply-To: <CAKwvOdkoixg0D0_6F7v=PyhkgbR6UEe1CHKYM3M=5PrwtLkdgw@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8130759612917852375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/26/19 2:11 AM, Nick Desaulniers wrote:
> On Mon, Nov 25, 2019 at 12:11 AM Rong Chen <rong.a.chen@intel.com> wrot=
e:
>> Hi Nick,
>>
>> On 11/22/19 3:10 AM, Nick Desaulniers wrote:
>>> On Wed, Nov 20, 2019 at 2:46 PM Atish Patra <Atish.Patra@wdc.com> wro=
te:
>>>> On Mon, 2019-11-18 at 22:39 -0800, Nick Desaulniers wrote:
>>>>> Atish, below is a report from 0day bot from a build with Clang. The
>>>>> warning looks legit, can you please take a look?
>>>>>
>>>> Hi Nick,
>>>> Thanks for the email. This is a work in progress branch. Is there way
>>>> not to trigger kbuild tests on this branch ?
>>> That's a common question that Rong or Philip can answer (I forgot what
>>> the answer has been in the past).  Rong/Philip, it may be good to have
>>> a URL/link that I can point people to in the future, since it's a FAQ.
>> We have blacklisted "efi_stub" and "wip_.*" branches for Atish. In
>> general, branches named as ".*experimental.*" or ".*dont-build"
>> won't be tested by default. and we have a doc to introduce basic
>> configurations: https://github.com/intel/lkp-tests/wiki/Repo-Spec
> Thanks for the link. Looks like it doesn't mention the `wip_`
> convention, and it says `*experiment*` (more specifically).  Would you
> mind either adding the note about `wip_` or a new wiki page saying "If
> you don't want 0day bot to find/test your branches, please use the
> following naming conventions when pushing branches: XXX."  That way in
> the future when I nag someone, and it was just an experimental branch,
> I can just send them the link to the wiki about the convention, and
> don't have to nag you?
>
>

Hi Nick,

Sorry for the delay,=C2=A0 I just got the permission to write a doc in =

github, please see

https://github.com/intel/lkp-tests/wiki/LKP-FAQ#is-there-a-way-not-to-trigg=
er-kbuild-tests-on-a-specific-branch

Best Regards,
Rong Chen
--===============8130759612917852375==--

