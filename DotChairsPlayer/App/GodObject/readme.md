# Factory?

[Pilky.me - Using Storyboards](http://pilky.me/view/37 "Pilky.me - Using Storyboards")

がベースとなってる。

 AppDelegateで、AppFactoryが `window.rootViewController` をしたり、
かなり上位の存在として位置づけてる。

ViewControllerが特殊な遷移が必要なときは、　`weak` なAppFactoryのインスタンスを渡して、そこから色々出来るようにする。

差し替えが容易なのやStoryboardやxibの区別は `AppEntryFactory` あたりがやることなので各ViewControllerは考えさせない。