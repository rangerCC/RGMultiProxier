# RGMultiProxier

多代理分发实践

* 无返回值代理方法，多个代理同时实现时，均会执行
* 有返回值代理方法，多个代理同时实现时，以最后一个代理执行结果为准(oc方法执行结果都保存在寄存器R0上，后执行的会覆盖前面的结果)


真正的大神在这里：[大神的github](https://github.com/alessandroorru/AOMultiproxier)
