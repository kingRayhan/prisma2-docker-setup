import { Request, Response } from 'express'

const register = async (req: Request, res: Response) => {
    res.json({
        ...req.body,
    })
}
const login = async (req: Request, res: Response) => {
    res.json({
        ...req.body,
    })
}

export { register, login }
